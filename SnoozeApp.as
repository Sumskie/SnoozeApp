package {
	
	import com.myflashlab.air.extensions.dependency.OverrideAir;
	import com.myflashlab.air.extensions.localNotifi.*;
	
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
			
			// this is the first thing you should do to initialize the notification ANE
			Notification.init();
			trace("Notification ANE loaded...");

			// Start listening to this event as soon as possible. If your app opens because of the notification has been
			// touched from the status bar, this listener will be called to let you know about it.
			Notification.listener.addEventListener(NotificationEvents.NOTIFICATION_INVOKED, onNotifiInvoked);
     
			// For iOS, create a NotificationIosSettings and for Android create a NotificationAndroidSettings instance
			var setting:NotificationIosSettings = new NotificationIosSettings();
			setting.notificationId = 3; // setting new notifications with the same id will override the old one
			setting.payload = "payload data";
			setting.title = "the title";
			setting.message = "the message";
			setting.time = new Date().getTime() + 5000; // means 5 seconds from now
			setting.sound = "iosSound.caf"; // the sound file which must be packaged in your .ipa file
			
			
		}
		
		private function onClick(evt:Event):void {
			trace("Login started...");
			
		}

	}
	
}
