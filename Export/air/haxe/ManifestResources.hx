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

		data = '{"name":null,"assets":"aoy4:sizei102764y4:typey4:FONTy9:classNamey36:__ASSET__fonts_freebooterupdated_ttfy2:idy29:fonts%2FFreebooterUpdated.ttfgoR0i16510R1y5:IMAGER3y35:__ASSET__images_background_tile_pngR5y28:images%2Fbackground_tile.pnggoR0i157449R1R7R3y33:__ASSET__images_center_bottom_pngR5y26:images%2Fcenter_bottom.pnggoR0i15520R1R7R3y26:__ASSET__images_cursor_pngR5y19:images%2Fcursor.pnggoR0i15530R1R7R3y36:__ASSET__images_cursor_highlight_pngR5y29:images%2Fcursor_highlight.pnggoR0i1249R1R7R3y29:__ASSET__images_game_bear_pngR5y22:images%2Fgame_bear.pnggoR0i1062R1R7R3y33:__ASSET__images_game_bunny_02_pngR5y26:images%2Fgame_bunny_02.pnggoR0i1310R1R7R3y31:__ASSET__images_game_carrot_pngR5y24:images%2Fgame_carrot.pnggoR0i1499R1R7R3y30:__ASSET__images_game_lemon_pngR5y23:images%2Fgame_lemon.pnggoR0i969R1R7R3y30:__ASSET__images_game_panda_pngR5y23:images%2Fgame_panda.pnggoR0i1737R1R7R3y34:__ASSET__images_game_piratepig_pngR5y27:images%2Fgame_piratePig.pnggoR0i19199R1R7R3y24:__ASSET__images_logo_pngR5y17:images%2Flogo.pnggoR0i14432R1y5:SOUNDR3y21:__ASSET__sounds_3_wavR5y6:sound3goR0i135984R1R30R3y21:__ASSET__sounds_4_wavR5y6:sound4goR0i441044R1R30R3y21:__ASSET__sounds_5_wavR5y6:sound5goR0i167574R1y5:MUSICR3y25:__ASSET__sounds_theme_oggR5y10:soundThemegh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
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

@:keep @:bind @:noCompletion #if display private #end class __ASSET__fonts_freebooterupdated_ttf extends flash.text.Font { }
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
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_3_wav extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_4_wav extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_5_wav extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__sounds_theme_ogg extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends flash.utils.ByteArray { }


#elseif (desktop || cpp)

@:keep @:font("Assets/fonts/FreebooterUpdated.ttf") @:noCompletion #if display private #end class __ASSET__fonts_freebooterupdated_ttf extends lime.text.Font {}
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
@:keep @:file("Assets/sounds/3.wav") @:noCompletion #if display private #end class __ASSET__sounds_3_wav extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/4.wav") @:noCompletion #if display private #end class __ASSET__sounds_4_wav extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/5.wav") @:noCompletion #if display private #end class __ASSET__sounds_5_wav extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/theme.ogg") @:noCompletion #if display private #end class __ASSET__sounds_theme_ogg extends haxe.io.Bytes {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__fonts_freebooterupdated_ttf') @:noCompletion #if display private #end class __ASSET__fonts_freebooterupdated_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "fonts/FreebooterUpdated.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Freebooter"; super (); }}


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