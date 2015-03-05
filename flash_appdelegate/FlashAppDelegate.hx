/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package flash_appdelegate;

import cpp.Lib;

import msignal.Signal;

class FlashAppDelegate 
{

    /**
      * Dispatched by the Stage object when the pointer moves out of the stage area.
    **/
    public var onMouseLeave(default, null): Signal0;

    static private var appDelegateInstance: FlashAppDelegate;

	private function new(): Void
  {
        onMouseLeave = new Signal0();
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