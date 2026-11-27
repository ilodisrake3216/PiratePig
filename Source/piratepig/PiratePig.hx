package piratepig;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.system.Capabilities;
import openfl.Assets;
import openfl.Lib;
import extension.ads.FakeAds;
import extension.ads.AdsI;

class PiratePig extends Sprite {
	
	private var Background:Bitmap;
	private var Footer:Bitmap;
	private var Game:PiratePigGame; 
	
	private var ads:AdsI;
	private var interstitialId:Int = -1;
	private var rewardedId:Int = -1;
	private var lastTime:Int = 0;
	
	public function new () {
		super ();
		initialize ();
		construct ();
		resize (stage.stageWidth, stage.stageHeight);
		stage.addEventListener (Event.RESIZE, stage_onResize);
		var fakeAds = new FakeAds();
		fakeAds.set_allow(true);
		fakeAds.set_reward(true);
		interstitialId = fakeAds.AddInterstitial();
		rewardedId = fakeAds.AddRewarded();
		ads = fakeAds;
		ads.set_on_inited(function(ok:Bool) {
			trace("on_inited: " + ok);
		});
		ads.set_on_show(function(id:Int, show:Bool) {
			trace("on_show -> id: " + id + ", show: " + show);
		});
		
		ads.set_on_reward(function(id:Int) {
			trace("on_reward -> id: " + id);
		});
		
		ads.set_on_error(function(id:Int, err:String) {
			trace("on_error -> id: " + id + ", err: " + err);
		});
		fakeAds.Init();
		lastTime = Lib.getTimer();
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
		stage.addEventListener(MouseEvent.CLICK, onStageClick);
	}
	private function onStageClick(e:MouseEvent):Void {
		if (ads != null && ads.IsAdReady(rewardedId)) {
			trace("Показываем рекламу id = " + rewardedId);
			ads.ShowAd(rewardedId);
		}
	}
	private function onEnterFrame(event:Event):Void {
		var now = Lib.getTimer();
		var dt = (now - lastTime) / 1000.0;
		lastTime = now;	
		if (ads != null) {
			ads.Process(dt);
		}
	}
	
	private function construct ():Void {
		Footer.smoothing = true;
		addChild (Background);
		addChild (Footer);
		addChild (Game);
	}
	private function initialize ():Void {
		Background = new Bitmap (Assets.getBitmapData ("images/background_tile.png"));
		Footer = new Bitmap (Assets.getBitmapData ("images/center_bottom.png"));
		Game = new PiratePigGame ();
	}
	private function resize (newWidth:Int, newHeight:Int):Void {
		Background.width = newWidth;
		Background.height = newHeight;	
		Game.resize (newWidth, newHeight);
		Footer.scaleX = Game.currentScale;
		Footer.scaleY = Game.currentScale;
		Footer.x = newWidth / 2 - Footer.width / 2;
		Footer.y = newHeight - Footer.height;
	}
	private function stage_onResize (event:Event):Void {
		resize (stage.stageWidth, stage.stageHeight);
	}
}
