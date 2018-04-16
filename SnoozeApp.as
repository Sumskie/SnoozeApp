package {
	
	//Firebase ID: snoozeapp-88b67
	
	import com.myflashlab.air.extensions.dependency.OverrideAir;
	import com.myflashlab.air.extensions.localNotifi.*;
	
	import com.myflashlab.air.extensions.firebase.core.Firebase;
	import com.myflashlab.air.extensions.firebase.db.*;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	
	import starling.events.Event; 
	
	import feathers.themes.MetalWorksMobileTheme;
	import feathers.controls.*;
	import feathers.layout.*;
	import starling.display.Button;
	
	public class SnoozeApp extends Sprite {

		private var button:Button;
		private var appHeader:Header;
		private var appLayout:VerticalLayout;
		private var appContainer:ScrollContainer;
		private var imageLoader:ImageLoader;

		public function SnoozeApp() {
			
			this.addEventListener(Event.ADDED_TO_STAGE, startApp);
		}
		
		private function startApp(evt:Event):void {
			trace("Starling loaded.");
			
			new MetalWorksMobileTheme();
			trace("Theme Loaded");
			button = new Button();
			button.label = "Login";
			button.addEventListener(Event.TRIGGERED, onClick);
			//this.addChild(button);
			
			appHeader = new Header();
			appHeader.width = Starling.current.stage.stageWidth;
			appHeader.title = "You Snooze, They Lose";
			this.addChild(appHeader);
			
			appLayout = new VerticalLayout();
			appLayout.paddingTop = 30;
			appLayout.paddingRight = 20;
			appLayout.paddingLeft = 20;
			appLayout.paddingBottom = 30;
			appLayout.horizontalAlign = feathers.layout.HorizontalAlign.CENTER;
			appLayout.verticalAlign = feathers.layout.VerticalAlign.MIDDLE;
			
			appContainer = new ScrollContainer();
			appContainer.layout = appLayout;
			appContainer.width = Starling.current.stage.stageWidth;
			appContainer.height = Starling.current.stage.stageHeight;
			this.addChild(appContainer);
			

			
			//Adding the text input feather function
			var Username:TextInput = new TextInput();
			Username.prompt = "Username";
			Username.maxChars = 12;
			Username.paddingBottom = 10;
			//This can be used to callout max char or allowed chartype
			//Username.addEventListener( FeathersEventType.FOCUS_IN, input_focusInHandler );
			appContainer.addChild( Username );
			
			var Password:TextInput = new TextInput();
			Password.displayAsPassword = true;
			Password.prompt = "Password";
			Password.paddingBottom = 10;
			appContainer.addChild( Password );
			
			//Let's use this as the login button
			appContainer.addChild(button);
			
			//Initialize firebase core
			Firebase.init();
			
			//Initialize firebase realtime database
			DB.init();
			
			trace("loaded: Firebase Core ANE & Firebase Realtime DB ANE");
			
		}
		
		private function onClick(evt:Event):void {
			trace("Login started...");
			
		}

	}
	
}
