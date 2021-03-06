// Acoustid -- Audio fingerprint lookup server
// Copyright (C) 2010  Lukas Lalinsky
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

package org.acoustid.server.handler;

public class HandlerException extends Exception {

	private static final long serialVersionUID = 2215780284242435967L;

	/**
     * Creates a new instance of <code>HandlerException</code> without detail message.
     */
    public HandlerException() {
    }


    /**
     * Constructs an instance of <code>HandlerException</code> with the specified detail message.
     * @param msg the detail message.
     */
    public HandlerException(String msg) {
        super(msg);
    }

    /**
     * Constructs an instance of <code>HandlerException</code> with the specified detail message and cause.
     * @param msg the detail message.
     * @param cause the cause.
     */
    public HandlerException(String msg, Throwable cause) {
        super(msg, cause);
    }

}
