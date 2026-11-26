package;

import haxe.io.Bytes;
import haxe.io.Path;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

			if(!StringTools.endsWith (rootPath, "/")) {

				rootPath += "/";

			}

		}

		if (rootPath == null) {

			#if (ios || tvos)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif (emscripten || webassembly)
			rootPath = "";
			#elseif (console || sys)
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_freebooterupdated_ttf);
		
		#end

		var data, manifest, library, bundle;

		data = '{"name":null,"assets":"aoy4:sizei102764y4:typey4:FONTy9:classNamey36:__ASSET__fonts_freebooterupdated_ttfy2:idy29:fonts%2FFreebooterUpdated.ttfy7:preloadtgoy4:pathy28:images%2Fbackground_tile.pngR0i16510R1y5:IMAGER5R9R7tgoR8y26:images%2Fcenter_bottom.pngR0i157449R1R10R5R11R7tgoR8y19:images%2Fcursor.pngR0i15520R1R10R5R12R7tgoR8y29:images%2Fcursor_highlight.pngR0i15530R1R10R5R13R7tgoR8y22:images%2Fgame_bear.pngR0i1249R1R10R5R14R7tgoR8y26:images%2Fgame_bunny_02.pngR0i1062R1R10R5R15R7tgoR8y24:images%2Fgame_carrot.pngR0i1310R1R10R5R16R7tgoR8y23:images%2Fgame_lemon.pngR0i1499R1R10R5R17R7tgoR8y23:images%2Fgame_panda.pngR0i969R1R10R5R18R7tgoR8y27:images%2Fgame_piratePig.pngR0i1737R1R10R5R19R7tgoR8y17:images%2Flogo.pngR0i19199R1R10R5R20R7tgoR0i2115R1y5:SOUNDR5y6:sound3y9:pathGroupay14:sounds%2F3.mp3R24y14:sounds%2F3.oggy14:sounds%2F3.wavhR7tgoR0i12982R1R21R5y6:sound4R23ay14:sounds%2F4.mp3R28y14:sounds%2F4.oggy14:sounds%2F4.wavhR7tgoR0i80692R1R21R5y6:sound5R23ay14:sounds%2F5.mp3R32y14:sounds%2F5.oggy14:sounds%2F5.wavhR7tgoR0i160522R1y5:MUSICR5y10:soundThemeR23ay18:sounds%2Ftheme.mp3R37y18:sounds%2Ftheme.oggy18:sounds%2Ftheme.wavhR7tgoR0i2115R1R35R5R24R23aR24R24R25R26hgoR0i6323R1R21R5R25R23aR24R24R25R26hgoR0i14432R1R21R5R26R23aR24R24R25R26hgoR0i12982R1R35R5R28R23aR28R28R29R30hgoR0i18481R1R21R5R29R23aR28R28R29R30hgoR0i135984R1R21R5R30R23aR28R28R29R30hgoR0i80692R1R35R5R32R23aR32R32R33R34hgoR0i16639R1R21R5R33R23aR32R32R33R34hgoR0i441044R1R21R5R34R23aR32R32R33R34hgoR0i160522R1R35R5R37R23aR37R37R38R39hgoR0i167574R1R21R5R38R23aR37R37R38R39hgoR0i1764044R1R21R5R39R23aR37R37R38R39hgoR0i45165R1R35R5y18:sounds%2Fwhiff.mp3R23aR40y18:sounds%2Fwhiff.oggy18:sounds%2Fwhiff.wavhR7tgoR0i52258R1R21R5R41R23aR40R41R42hgoR0i491080R1R21R5R42R23aR40R41R42hgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

	}


}

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__fonts_freebooterupdated_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__images_background_tile_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__images_center_bottom_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__images_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__images_cursor_highlight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__images_game_bear_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__images_game_bunny_02_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__images_game_carrot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__images_game_lemon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__images_game_panda_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__images_game_piratepig_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__images_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_3_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_4_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_5_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_theme_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_3_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_3_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_5 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_4_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_4_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_6 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_5_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_5_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_theme_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_theme_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_theme_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_whiff_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_whiff_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_whiff_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:font("Export/html5/obj/webfont/FreebooterUpdated.ttf") @:noCompletion #if display private #end class __ASSET__fonts_freebooterupdated_ttf extends lime.text.Font {}
@:keep @:image("Assets/images/background_tile.png") @:noCompletion #if display private #end class __ASSET__images_background_tile_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/center_bottom.png") @:noCompletion #if display private #end class __ASSET__images_center_bottom_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/cursor.png") @:noCompletion #if display private #end class __ASSET__images_cursor_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/cursor_highlight.png") @:noCompletion #if display private #end class __ASSET__images_cursor_highlight_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/game_bear.png") @:noCompletion #if display private #end class __ASSET__images_game_bear_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/game_bunny_02.png") @:noCompletion #if display private #end class __ASSET__images_game_bunny_02_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/game_carrot.png") @:noCompletion #if display private #end class __ASSET__images_game_carrot_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/game_lemon.png") @:noCompletion #if display private #end class __ASSET__images_game_lemon_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/game_panda.png") @:noCompletion #if display private #end class __ASSET__images_game_panda_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/game_piratePig.png") @:noCompletion #if display private #end class __ASSET__images_game_piratepig_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/logo.png") @:noCompletion #if display private #end class __ASSET__images_logo_png extends lime.graphics.Image {}
@:keep @:file("Assets/sounds/3.mp3") @:noCompletion #if display private #end class __ASSET__sounds_3_mp3 extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/4.mp3") @:noCompletion #if display private #end class __ASSET__sounds_4_mp3 extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/5.mp3") @:noCompletion #if display private #end class __ASSET__sounds_5_mp3 extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/theme.mp3") @:noCompletion #if display private #end class __ASSET__sounds_theme_mp3 extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/3.mp3") @:noCompletion #if display private #end class __ASSET__sounds_4 extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/3.ogg") @:noCompletion #if display private #end class __ASSET__sounds_3_ogg extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/3.wav") @:noCompletion #if display private #end class __ASSET__sounds_3_wav extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/4.mp3") @:noCompletion #if display private #end class __ASSET__sounds_5 extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/4.ogg") @:noCompletion #if display private #end class __ASSET__sounds_4_ogg extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/4.wav") @:noCompletion #if display private #end class __ASSET__sounds_4_wav extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/5.mp3") @:noCompletion #if display private #end class __ASSET__sounds_6 extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/5.ogg") @:noCompletion #if display private #end class __ASSET__sounds_5_ogg extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/5.wav") @:noCompletion #if display private #end class __ASSET__sounds_5_wav extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/theme.mp3") @:noCompletion #if display private #end class __ASSET__sounds_theme_mp4 extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/theme.ogg") @:noCompletion #if display private #end class __ASSET__sounds_theme_ogg extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/theme.wav") @:noCompletion #if display private #end class __ASSET__sounds_theme_wav extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/whiff.mp3") @:noCompletion #if display private #end class __ASSET__sounds_whiff_mp3 extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/whiff.ogg") @:noCompletion #if display private #end class __ASSET__sounds_whiff_ogg extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/whiff.wav") @:noCompletion #if display private #end class __ASSET__sounds_whiff_wav extends haxe.io.Bytes {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__fonts_freebooterupdated_ttf') @:noCompletion #if display private #end class __ASSET__fonts_freebooterupdated_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "fonts/FreebooterUpdated"; #else ascender = 1772; descender = -684; height = 2456; numGlyphs = 263; underlinePosition = -205; underlineThickness = 102; unitsPerEM = 2452; #end name = "Freebooter"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__fonts_freebooterupdated_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__fonts_freebooterupdated_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__fonts_freebooterupdated_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__fonts_freebooterupdated_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__fonts_freebooterupdated_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__fonts_freebooterupdated_ttf ()); super (); }}

#end

#end
#end

#end