package app
{
	import app.Background;
	import app.ButtonAnimation;
	import app.Logo;
	import app.MenuButtonMain;
	import app.NavigationFooterBar;
	import app.NavigationMainBar;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
		

	
	public class Logo extends MovieClip
	{
		
		public static const STATUS_CHANGED:String = "statusChanged";
		public static const STATUS_CHANGED_BACK:String = "statusChangedBack";
		
		public static const PLAY_ANIMATION:String = "playAnimation";
		
		private var _logoData:Array;
		public var mc:MovieClip;
		
		public var i:int=0;
		
		public function Logo(logoData:Array)
		{
			_logoData=logoData;
			trace("Mortena palm");
			buttonMode=true;
			useHandCursor=false;
			mouseChildren=false;
			
			addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
			
			//i=_logoData.length;
						
			
			//this.mouseChildren=true;
			
		}
		
		
		public function mouseOver(e:MouseEvent):void{
		//	removeEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			if(i==0){
				mc = _logoData[int(Math.random()*_logoData.length)];
				addChild(mc);
				i=1;
			}
			
			mc.removeEventListener(Event.ENTER_FRAME, rewind);
			mc.play();
			mc.addEventListener(Event.ENTER_FRAME, advance);
			
			dispatchEvent(new Event("statusChanged", true));


			
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
			
			dispatchEvent(new Event("statusChangedBack", true));


			
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
				i=0;
				mc.stop();
				mc.removeEventListener(Event.ENTER_FRAME, rewind);
			}else {
				mc.prevFrame();
			}
		}
		
	}
}