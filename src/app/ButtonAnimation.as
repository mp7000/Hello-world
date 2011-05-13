package app
{
	import app.MenuButtonMain();
	import flash.display.MovieClip;
	
	public class ButtonAnimation extends MovieClip
	{
		public function ButtonAnimation()
		{
			stage.addEventListener("playAnimation", show);

		}
		
		private function show(e:Event):void{
			this.gotoAndPlay(2);
			//bgMain.gotoAndPlay(2);
			//bgMain.visible=true;
		}
	}
}