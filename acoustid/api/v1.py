# Copyright (C) 2011 Lukas Lalinsky
# Distributed under the MIT license, see the LICENSE file for details.

import logging
from acoustid.handler import Handler
from acoustid.data.fingerprint import decode_fingerprint
from acoustid.api import v2, serialize_response, errors

logger = logging.getLogger(__name__)


FORMAT = 'xml'


class APIHandlerParams(v2.APIHandlerParams):

    def _parse_format(self, values):
        self.format = FORMAT


class APIHandler(v2.APIHandler):

    params_class = None

    def _error(self, code, message, format=FORMAT, status=400):
        assert format == FORMAT
        response_data = {
            '@status': 'error',
            'error': message,
        }
        return serialize_response(response_data, format, status=status)

    def _ok(self, data, format=FORMAT):
        assert format == FORMAT
        response_data = {'@status': 'ok'}
        response_data.update(data)
        return serialize_response(response_data, format)


class LookupHandlerParams(APIHandlerParams):

    def parse(self, values, conn):
        super(LookupHandlerParams, self).parse(values, conn)
        self._parse_client(values, conn)
        self.meta = values.get('meta', type=int)
        if self.meta > 1:
            self.meta = 1
        self.duration = values.get('length', type=int)
        if not self.duration:
            raise errors.MissingParameterError('length')
        fingerprint_string = values.get('fingerprint')
        if not fingerprint_string:
            raise errors.MissingParameterError('fingerprint')
        self.fingerprint = decode_fingerprint(fingerprint_string)
        if not self.fingerprint:
            raise errors.InvalidFingerprintError()


class LookupHandler(v2.LookupHandler):

    params_class = LookupHandlerParams
    recordings_name = 'tracks'


class SubmitHandlerParams(v2.SubmitHandlerParams):

    def _parse_format(self, values):
        self.format = FORMAT

    def _parse_duration_and_format(self, p, values, suffix):
        p['duration'] = values.get('length' + suffix, type=int)
        if not p['duration']:
            raise errors.MissingParameterError('length' + suffix)
        p['format'] = values.get('format' + suffix)


class SubmitHandler(v2.SubmitHandler):

    params_class = SubmitHandlerParams

