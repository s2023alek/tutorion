// Project TTCC
package ttcc.d.m {
	
	//{ =*^_^*= import
	import ttcc.d.i.ISerializable;
	import ttcc.d.m.AbstractModel;
	import ttcc.d.s.WBUpdateModelMessage;
	import ttcc.LOG;
	//} =*^_^*= END OF import
	
	
	/**
	 * 
	 * @author Jinanoimatey Dragoncat
	 * @version 0.0.0
	 * @created 31.08.2012 0:56
	 */
	public class WBComModel extends AbstractModel {
		
		//{ =*^_^*= CONSTRUCTOR
		function WBComModel () {
		}
		public override function destruct():void {
			super.destruct();
		}
		//} =*^_^*= END OF CONSTRUCTOR
		
		//{ =*^_^*= write access
		public function addUpdates(a:Array):void {
			for each(var i:WBUpdateModelMessage in a) {
				addUpdate(i, true);
			}
		}
		public function addUpdate(a:WBUpdateModelMessage, fromServer:Boolean=false):void {
			newMessagesList.push(a);
			lastUpdateMessage=a;
			if (!fromServer) {transfer(ID_P_A_ADD_MESSAGES);}
			reflect(ID_P_UPDATES);
		}
		//} =*^_^*= END OF write access
		
		
		//{ =*^_^*= read
		//public function get_messagesList():Array {return messagesList;}//not used
		/**
		 * [WBUpdateModelMessage]
		 */
		public function get_newUpdatesList():Array {
			var l:Array=newMessagesList;newMessagesList=[];return l;
		}
		//} =*^_^*= END OF read
		
		//{ =*^_^*= =*^_^*= private 
		//} =*^_^*= =*^_^*= END OF private
		
		
		//{ =*^_^*= model contens
		private var lastUpdateMessage:WBUpdateModelMessage;
		/**
		 * [WBUpdateModelMessage]
		 */
		private var newMessagesList:Array=[];
		//} =*^_^*= END OF model contens
		
		//{ =*^_^*= property id
		private static const ID_P_A_ADD_MESSAGES:uint=0;
		public static const ID_P_UPDATES:uint=1;
		//} =*^_^*= END OF property id
		
		
		//{ =*^_^*= reflection
		protected override function resetModel(updateFromDataport:Boolean=false):void {
			newMessagesList=[];
			lastUpdateMessage=null;
			
			//markForReflect(ID_P_CLEAR_MESSAGES);
			markForReflect(ID_P_UPDATES);
		}
		//} =*^_^*= END OF reflection
		
		//{ =*^_^*= working with data
		/**
		 * override and place your code here
		 * @param	elementID
		 * @return rawData
		 */
		protected override function serialize(elementID:uint):Object {
			switch (elementID) {
			
			case ID_P_A_ADD_MESSAGES:return serializeArray([lastUpdateMessage]);break;
			
			//case ID_P_UPDATES:return /*serializeArray(messagesList)*/null;break;
			
			}
			return null;
		}
		
		/**
		 * 
		 * @param	elementID
		 * @param	rawData
		 */
		protected override function deserializeAndStore(elementID:uint, rawData:Object):void {
			switch (elementID) {
			
			case ID_P_A_ADD_MESSAGES:addUpdates(deserializeArray(rawData, WBUpdateModelMessage));break;
			
			//case ID_P_UPDATES:/*messagesList=deserializeArray(rawData, WBUpdateModelMessage);*/break;
			
			
			}
		}
		//} =*^_^*= END OF working with data
		
	}
}

//{ =*^_^*= History
/* > (timestamp) [ ("+" (added) ) || ("-" (removed) ) || ("*" (modified) )] (text)
 * > 
 */
//} =*^_^*= END OF History

// template last modified:11.03.2011_[18#51#40]_[5]