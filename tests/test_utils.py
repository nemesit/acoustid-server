# Copyright (C) 2011 Lukas Lalinsky
# Distributed under the MIT license, see the LICENSE file for details.

from nose.tools import *
from acoustid.utils import singular, is_uuid, provider


def test_singular():
    assert_equals('artist', singular('artists'))
    assert_equals('release', singular('releases'))
    assert_equals('city', singular('cities'))
    assert_raises(ValueError, singular, 'city')


def test_is_uuid():
    assert_true(is_uuid('83fdc319-b05e-4edc-9371-f7ff09fc642e'))
    assert_false(is_uuid('83fdc319-b05e-4edc-9371-xxxxxxxxxxxx'))


def test_provider():
    assert_equals('foo', provider('foo')())

