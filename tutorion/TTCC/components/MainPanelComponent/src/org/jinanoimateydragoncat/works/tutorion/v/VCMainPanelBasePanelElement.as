package org.jinanoimateydragoncat.works.tutorion.v {
	
	//{ =*^_^*= import
	import org.aswing.Component;
	//} =*^_^*= END OF import
	
	
	/**
	 * base element - template
	 * @author Jinanoimatey Dragoncat
	 * @version 0.0.0
	 * @created 14.05.2012 21:36
	 */
	public class VCMainPanelBasePanelElement implements VCMainPanelIPanelElement {
		
		//{ =*^_^*= CONSTRUCTOR
		function VCMainPanelBasePanelElement () {
		}
		//} =*^_^*= END OF CONSTRUCTOR
		
		
		public function setOwner(a:VCMainPanel):void {
			owner=a;
		}
		public function getComponent():Component {
			return com;
		}
		
		
		protected var owner:VCMainPanel;
		protected var com:Component;
		
	}
}

//{ =*^_^*= History
/* > (timestamp) [ ("+" (added) ) || ("-" (removed) ) || ("*" (modified) )] (text)
 * > 
 */
//} =*^_^*= END OF History

// template last modified:11.03.2011_[18#51#40]_[5]