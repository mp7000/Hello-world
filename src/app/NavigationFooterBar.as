package app
{
	import app.FooterButtonMain;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class NavigationFooterBar extends MovieClip
	{
		
		private var _navFooterData:Array;
		private var posX:int;
		private var container:Sprite;
		
		
		public function NavigationFooterBar(navFooterData:Array)
		{
			_navFooterData = navFooterData;
			
			if (stage) build();
			else addEventListener(Event.ADDED_TO_STAGE, build);
		}
		
		private function build(e:Event=null):void {
			
			stage.addEventListener(Event.RESIZE, handleStageResize);

			
			container = new Sprite();
			container.graphics.beginFill(0xffffff,0);
			container.graphics.drawRect(0,0,200,30);
			container.graphics.endFill();
			
			container.x=stage.stageWidth-200;
			container.y=stage.stageHeight-58;
			
			addChild(container);
			
			posX = container.width;
			
			for (var i:int=0; i < _navFooterData.length; i++) {
				var footerBtn:FooterButtonMain = new FooterButtonMain();
				footerBtn.tf.text=(_navFooterData[i]);
				footerBtn.name = _navFooterData[i];
				trace(footerBtn.name);
				footerBtn.x = posX-38;
				footerBtn.y = 29;
				
				container.addChild(footerBtn);					
				//opdater posX	
				posX -= footerBtn.width +1;
			}
			
		}
		private function handleStageResize(e:Event):void {
			//posX = stage.stageWidth;
			//.x=posX;
			
			
			container.x=stage.stageWidth-200;
			container.y=stage.stageHeight-59;
			
			
			
		}

		
	}//class
}//Package