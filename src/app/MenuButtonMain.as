package app
{
	import app.Background;
	import app.FooterButtonMain;
	import app.ButtonAnimation;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class MenuButtonMain extends MovieClip
	{
		
		
	//	private var _btnLabel:TextField;
	//	private var _obj:Object;
		public static const STATUS_CHANGED:String = "statusChanged";
		public static const STATUS_CHANGED_BACK:String = "statusChangedBack";
		
		public static const PLAY_ANIMATION:String = "playAnimation";


		



		
		public function MenuButtonMain()
		{
		//	super();
		//	_btnLabel = new TextField();
		//	_btnLabel.autoSize = TextFieldAutoSize.CENTER;
		//	_btnLabel.textColor = 0xFFFFFF;
		//	_btnLabel.text = labl;
		//	_btnLabel.mouseEnabled = false;
		//	addChild(_btnLabel);
			trace("HEJEJEJ");
			buttonMode = true;
			useHandCursor = true;
			mouseChildren = false;
		//	addEventListener(MouseEvent.ROLL_OVER, test);

//			addEventListener(MouseEvent.ROLL_OVER, showBg);
			addEventListener(MouseEvent.ROLL_OVER, mouseOver);

			addEventListener(MouseEvent.ROLL_OUT, mouseOut);
			
		//	addEventListener("CustomEvent",test);

		//	addEventListener(MouseEvent.CLICK, mouseClick);
			

		}
				
		private function mouseOver(e:MouseEvent):void{
			var mc:MovieClip = MovieClip(e.currentTarget);
			(getChildByName("animation") as MovieClip).removeEventListener(Event.ENTER_FRAME, rewind);
			(getChildByName("animation") as MovieClip).play(); 
			(getChildByName("animation") as MovieClip).addEventListener(Event.ENTER_FRAME, advance);
			
			mc.removeEventListener(Event.ENTER_FRAME, rewind);
			mc.play()
			mc.addEventListener(Event.ENTER_FRAME, advance);
			dispatchEvent(new Event("statusChanged", true));
			
		//	dispatchEvent(new Event("playAnimation", true));


		//	dispatchEvent(new Event("CustomEvent"));
		//	dispatchTheEvent()
			
			//dispatch custom event her 
			
		}
	
		private function mouseOut(e:MouseEvent):void {
			var mc:MovieClip = MovieClip(e.currentTarget);
			mc.gotoAndPlay(1);
		//	(getChildByName("animation") as MovieClip).play(); 
			(getChildByName("animation") as MovieClip).addEventListener(Event.ENTER_FRAME, rewind);
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
		private function dispatchTheEvent():void{
			
			dispatchEvent(new Event(STATUS_CHANGED));
			
		}
/*		
		private function mouseClick(e:MouseEvent):void {
			if (_obj != null) {
			//	_obj.buttonMode = true;
			//	_obj.addEventListener(MouseEvent.ROLL_OVER, mouseOver);
			//	_obj.addEventListener(MouseEvent.ROLL_OUT, mouseOut);
				_obj.dispatchEvent(new MouseEvent(MouseEvent.ROLL_OUT));
			}
			_obj = e.target;
			_obj.dispatchEvent(new MouseEvent(MouseEvent.ROLL_OUT));
			_obj.gotoAndPlay("Selected");
						
			//gå til label i MenuButtonMain MC
			
			//gotoAndPlay("selected");
			//e.target.removeEventListener(MouseEvent.ROLL_OVER, mouseOver);
			//e.target.removeEventListener(MouseEvent.ROLL_OUT, mouseOut);
			
			//SWFaddress.setValue(e.target);
			
				
		}*/
	
	}//class
}//package