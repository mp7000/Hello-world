package app
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
		

	
	public class Logo extends MovieClip
	{
		private var _logoData:Array;
		public var mc:MovieClip;
		
		var i:int;
		
		public function Logo(logoData:Array)
		{
			_logoData=logoData;
			trace("Mortena palm");
			buttonMode=true;
			useHandCursor=false;
			mouseChildren=false;
			
			addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
			
			i=_logoData.length;
						
			
			//this.mouseChildren=true;
			
		}
		
		
		public function mouseOver(e:MouseEvent):void{
		//	removeEventListener(MouseEvent.MOUSE_OVER, mouseOver);

			mc = _logoData[int(Math.random()*_logoData.length)];
			addChild(mc);
			mc.removeEventListener(Event.ENTER_FRAME, rewind);
			mc.play();
			mc.addEventListener(Event.ENTER_FRAME, advance);

			
			//			var mc:MovieClip = MovieClip(e.currentTarget);

			//dispatchEvent(new Event("statusChanged", true));
			
			//	dispatchEvent(new Event("CustomEvent"));
			//	dispatchTheEvent()
			
			//dispatch custom event her */
			
		}
		
		private function mouseOut(e:MouseEvent):void {
			//var mc:MovieClip = MovieClip(e.currentTarget);
			//mc.gotoAndPlay(1);
			//dispatchEvent(new Event("statusChangedBack", true));*/
			mc.addEventListener(Event.ENTER_FRAME, rewind);

			
		}
		private function advance(e:Event):void {
			//var mc:MovieClip = MovieClip(e.currentTarget);
			if (mc.currentFrame==mc.totalFrames){
				mc.stop();
				mc.removeEventListener(Event.ENTER_FRAME, advance);
			}
		}
		
		private function rewind (e:Event):void {
		//	var mc:MovieClip = MovieClip(e.currentTarget);
			if (mc.currentFrame == 1){
				mc.stop();
				mc.removeEventListener(Event.ENTER_FRAME, rewind);
			}else {
				mc.prevFrame();
			}
		}
		
	}
}