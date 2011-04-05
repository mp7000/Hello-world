package app
{
	//import app.MenuButtonMain;
	import flash.display.MovieClip;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	public class FooterButtonMain extends MovieClip
	
	{
		
		public static const STATUS_CHANGED:String = "statusChanged";
		public static const STATUS_CHANGED_BACK:String = "statusChangedBack";
		
		public function FooterButtonMain()
		{
			buttonMode = true;
			useHandCursor = false;
			mouseChildren = false;
			
			addEventListener(MouseEvent.ROLL_OVER, mouseOver);
			
			addEventListener(MouseEvent.ROLL_OUT, mouseOut);
			
		}
		
		public function mouseOver(e:MouseEvent):void{
			var mc:MovieClip = MovieClip(e.currentTarget);
			mc.removeEventListener(Event.ENTER_FRAME, rewind);
			mc.gotoAndPlay(this.name)
			mc.addEventListener(Event.ENTER_FRAME, advance);
			dispatchEvent(new Event("statusChanged", true));
			
			//	dispatchEvent(new Event("CustomEvent"));
			//	dispatchTheEvent()
			
			//dispatch custom event her 
			
		}
		
		private function mouseOut(e:MouseEvent):void {
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
		private function dispatchTheEvent():void{
			
			dispatchEvent(new Event(STATUS_CHANGED));
			
		}
	}
}