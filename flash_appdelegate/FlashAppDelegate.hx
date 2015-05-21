/*
 * Copyright (c) 2003-2015, GameDuell GmbH
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

package flash_appdelegate;

import flash.events.Event;
import flash.Lib;
import flash.display.Stage;
import msignal.Signal;

class FlashAppDelegate
{
    /**
      * Dispatched by the Stage object when the pointer moves out of the stage area.
    **/
    public var onMouseLeave(default, null): Signal0;

    /**
      * Dispatched when the MovieClip is added to the stage. This is the callback when the application starts.
    **/
    public var onAddedToStage(default, null): Signal0;

    /**
      * Dispatched when the MovieClip is removed from the stage. This is the callback when the application terminates.
    **/
    public var onRemoveFromStage(default, null): Signal0;

    /**
      * Dispatched when the application gets active.
    **/
    public var onActivate(default, null): Signal0;

    /**
      * Dispatched when the application gets inactive.
    **/
    public var onDeactivate(default, null): Signal0;

    static private var appDelegateInstance: FlashAppDelegate;

    private var stage: Stage = flash.Lib.current.stage;

	private function new(): Void
    {
        onMouseLeave = new Signal0();
        onAddedToStage = new Signal0();
        onRemoveFromStage = new Signal0();
        onActivate = new Signal0();
        onDeactivate = new Signal0();
        connectListeners();
	}

    private function connectListeners(): Void
    {
        stage.addEventListener(Event.MOUSE_LEAVE, function (event: Dynamic){onMouseLeave.dispatch();});
        flash.Lib.current.addEventListener(Event.ADDED_TO_STAGE, function (event: Dynamic){onAddedToStage.dispatch();});
        flash.Lib.current.addEventListener(Event.REMOVED_FROM_STAGE, function (event: Dynamic){onRemoveFromStage.dispatch();});
        stage.addEventListener(Event.ACTIVATE, function (event: Dynamic){onActivate.dispatch();});
        stage.addEventListener(Event.DEACTIVATE, function (event: Dynamic){onDeactivate.dispatch();});
    }

	static public inline function instance(): FlashAppDelegate
	{
		if(appDelegateInstance == null)
		{
			appDelegateInstance = new FlashAppDelegate();
		}
		return appDelegateInstance;
	}
}
