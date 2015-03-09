/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
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