package app
{
	import app.ShareButtonMain;
	import app.testButton;
	
	import com.greensock.*;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	public class FooterButtonMain extends MovieClip
	
	{
		var _testButton:testButton;
		var _clientAreaButton:ClientAreaButton;
		
		var _shareButton:ShareButtonMain=new ShareButtonMain();
		public static const STATUS_CHANGED:String = "statusChanged";
		public static const STATUS_CHANGED_BACK:String = "statusChangedBack";
		
		public function FooterButtonMain()
		{
			buttonMode = true;
		//	useHandCursor = false;
		//	mouseChildren = true;
			
			//addChildAt(_shareButton,1);
			//_shareButton.visible=false;			
			
			addEventListener("test", test);

			
			addEventListener(MouseEvent.ROLL_OVER, mouseOver);
			
			addEventListener(MouseEvent.ROLL_OUT, mouseOut);

			//addEventListener(MouseEvent.CLICK, test);

		}
		
		public function mouseOver(e:MouseEvent):void{
			this.gotoAndPlay(2)

			if (this.name=="Share site"){
				_testButton=new testButton();
				addChild(_testButton);
		//		addChildAt(_tb,1);
			//	_testButton.x=-200;
			//	_testButton.y=-200;
				_testButton.visible=true;

				
			}else if (this.name=="Client area"){
				_clientAreaButton=new ClientAreaButton();
				addChild(_clientAreaButton);
				//		addChildAt(_tb,1);
					//_clientAreaButton.x=-200;
					_clientAreaButton.y=-50;
				//_clientAreaButton.visible=true;
			}
			
			
			var mc:MovieClip = MovieClip(e.currentTarget);
			mc.removeEventListener(Event.ENTER_FRAME, rewind);
			//afspiller den footerknap ud fra navnet
			mc.addEventListener(Event.ENTER_FRAME, advance);
			dispatchEvent(new Event("statusChanged", true));
			//	dispatchEvent(new Event("CustomEvent"));
			//	dispatchTheEvent()
			
			//dispatch custom event her 
			
		}
		
		private function mouseOut(e:MouseEvent):void {
		//	_shareButton.visible=false;
			if (this.name=="Share site"){
				removeChild(_testButton);
			}else if(this.name=="Client area"){
		
				removeChild(_clientAreaButton);
			}
//			_testButton.visible=false;

			var mc:MovieClip = MovieClip(e.currentTarget);
			mc.gotoAndPlay(1);
			dispatchEvent(new Event("statusChangedBack", true));
		}
		
		private function advance(e:Event):void {
			var mc:MovieClip = MovieClip(e.currentTarget);
			if (mc.currentFrame==mc.totalFrames){
				mc.stop();
				mc.removeEventListener(Event.ENTER_FRAME, advance);
			}
		}
		
		private function rewind (e:Event):void {
			var mc:MovieClip = MovieClip(e.currentTarget);
			if (mc.currentFrame == 1){
				mc.stop();
				mc.removeEventListener(Event.ENTER_FRAME, rewind);
			}else {
				mc.prevFrame();
			}
		}
		
		private function test(e:Event):void {
			
			tf.text="Thanks!";
			TweenLite.delayedCall(3, function(){
				//dispatchEvent(new Event("statusChangedBack", true));
				//dispatchEvent(new Event(MouseEvent.ROLL_OUT));

				//removeChild(_testButton);

			});

			
			dispatchEvent(new Event("statusChangedBack", true));

			
			TweenMax.to(this, 0.1, {delay:5, onComplete:function(){
				tf.text="Share site";

			
			}});	
				
					
				
				
		
			
			
		}

		
		private function dispatchTheEvent():void{
			
			dispatchEvent(new Event(STATUS_CHANGED));
			
		}
	}
}