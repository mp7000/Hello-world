package app
{
	import app.Background;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class MenuButtonMain extends MovieClip
	{
		
	//	private var _btnLabel:TextField;
	//	private var _obj:Object;
		
		
		public function MenuButtonMain()
		{
		//	super();
		//	_btnLabel = new TextField();
		//	_btnLabel.autoSize = TextFieldAutoSize.CENTER;
		//	_btnLabel.textColor = 0xFFFFFF;
		//	_btnLabel.text = labl;
		//	_btnLabel.mouseEnabled = false;
		//	addChild(_btnLabel);
			
			buttonMode = true;
			useHandCursor = true;
			mouseChildren = false;
		//	addEventListener(MouseEvent.ROLL_OVER, test);

//			addEventListener(MouseEvent.ROLL_OVER, showBg);
			addEventListener(MouseEvent.ROLL_OVER, mouseOver);

			addEventListener(MouseEvent.ROLL_OUT, mouseOut);
		//	addEventListener(MouseEvent.CLICK, mouseClick);
			

		}
		
		
		public function mouseOver(e:MouseEvent):void{
			var mc:MovieClip = MovieClip(e.currentTarget);
			mc.removeEventListener(Event.ENTER_FRAME, rewind);
			mc.play()
			mc.addEventListener(Event.ENTER_FRAME, advance);
		}
	
		private function mouseOut(e:MouseEvent):void {
			var mc:MovieClip = MovieClip(e.currentTarget);
			mc.gotoAndPlay(1);
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