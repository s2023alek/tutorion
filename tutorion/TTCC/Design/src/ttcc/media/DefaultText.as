﻿// Project TTCC
package ttcc.media {
	
	//{ =^_^= import
	//} =^_^= END OF import
	
	
	/**
	 * add constructor, parse XML
	 * @author Jinanoimatey Dragoncat
	 * @version 0.0.0
	 * @created 10.06.2012 15:42
	 */
	public class DefaultText {
		
		public function secondsToCurrentTime(a:Number, showSeconds:Boolean=true,showMinutes:Boolean=true):String {
			var seconds:Number = a;
			var minutes:Number = Math.floor(seconds/60);
			var hours:Number = Math.floor(minutes/60);
			
			hours %= 24;
			minutes %= 60;
			seconds %= 60;
			
			var sec:String = ((seconds<10)?'0':'')+seconds.toString();
			var min:String = ((minutes<10)?'0':'')+minutes.toString();
			var hrs:String = ((hours<10)?'0':'')+hours.toString();
			
			
			return hrs+':'+min+':'+sec;
		}
		public function secondsToTime(a:Number, showSeconds:Boolean=true,showMinutes:Boolean=true,showHours:Boolean=true, showDays:Boolean=false):String {
			
			var seconds:Number = Math.floor(a);
			var minutes:Number = Math.floor(seconds/60);
			var hours:Number = Math.floor(minutes/60);
			var days:Number = Math.floor(hours/24); 
			
			hours %= 24;
			minutes %= 60;
			seconds %= 60;
			
			var sec:String = seconds.toString();
			var min:String = minutes.toString();
			var hrs:String = hours.toString();
			var d:String = days.toString();
			
			
			var time:String = '';
			
			if (seconds>0&&showSeconds) {time = sec+' '+get_TEXT_TIME_SS();}
			if (minutes>0&&showMinutes) {time = min+' '+get_TEXT_TIME_MM()+' '+time;}
			if (hours>0&&showHours) {time = hrs+' '+get_TEXT_TIME_HH()+' '+time;}
			if (days>0&&showDays) {time = d+' '+get_TEXT_TIME_DD()+' '+time;}
			
			
			return time;
		}
		
		private static function processText(text:String, args:Array):String {
			if (args.length) {
				for (var i:String in args) {
					text = text.split('%' + i).join(args[int(i)]);
				}
			}
			return text;
		}
		
		//{ =*^_^*= TEXT
		public function get_MainMenuItemLabel(textID:String):String {
			var index:int=mainMenuItemLabel.indexOf(textID);
			if (index==-1) {return "no label for:\""+textID+"\"";}
			return mainMenuItemLabel[index+1];
		}
		private var mainMenuItemLabel:Array=[
			"securitySettings", "Настройки плеера"
			,"toggleFullscreen", "Полноэкранный режим"
			,"windowsLayouts", "Режим отображения"
			,"normalMode", "Нормальный"
			,"chatAndWb", "Чат и доска"
			,"chatAndAV", "Видео и доска"
		];
		
		public function get_TEXT(textID:uint):String {
			return TEXT_[textID];
		}
		private var TEXT_:Array=[
			'Чат'//ID_TEXT_CHAT_WINDOW_TITLE
			,'Дорогой'//ID_TEXT_CHAT_CL_DEAR
			,'&lt;Нет имени&gt;'//ID_TEXT_CHAT_CL_INVISIBLE_USER_NAME
			,'Пуск'//ID_TEXT_MAIN_PANEL_B_START
			,'Начните работу с нажатия этой кнопки'//ID_TEXT_MAIN_PANEL_B_START_TIP
			,'Менеджер курсов'//ID_TEXT_COURSE_LOADER_WINDOW_TITLE
			,'Аплоадер презентаций'//ID_TEXT_PRESENTATION_LOADER_WINDOW_TITLE
			,'Вставить на доску'//ID_TEXT_PRESENTATION_LOADER_B_APPLY
			,'Выбрать файл'//ID_TEXT_PRESENTATION_LOADER_B_LOAD
			,'Видео'//ID_TEXT_VIDEO_WINDOW_TITLE
			,'Настройки видео'//ID_TEXT_VIDEO_WINDOW_B_SETTINGS
			,'<Нет имени>'//ID_TEXT_VIDEO_CL_USER_NAME_IS_EMPTY
			,"Включить прием входящего видео"//ID_TEXT_VIDEO_B_TOGGLE_V_IN_ON:uint=12;
			,"Отключить прием входящего видео"//ID_TEXT_VIDEO_B_TOGGLE_V_IN_OFF:uint=13;
			,"Включить отправку видео"//ID_TEXT_VIDEO_B_TOGGLE_V_OUT_ON:uint=14;
			,"Отключить отправку видео"//ID_TEXT_VIDEO_B_TOGGLE_V_OUT_OFF:uint=15;
			,"Включить прием входящего аудио"//ID_TEXT_VIDEO_B_TOGGLE_AU_IN_ON:uint=16;
			,"Отключить прием входящего аудио"//ID_TEXT_VIDEO_B_TOGGLE_AU_IN_OFF:uint=17;
			,"Включить отправку аудио"//ID_TEXT_VIDEO_B_TOGGLE_AU_OUT_ON:uint=18;
			,"Отключить отправку аудио"//ID_TEXT_VIDEO_B_TOGGLE_AU_OUT_OFF:uint=19;
			,"Включить отправку потока\n(возобновить трансляцию)"//ID_TEXT_VIDEO_B_TOGGLE_S_ON:uint=20;
			,"Отключить отправку потока\n(прекратить трансляцию)"//ID_TEXT_VIDEO_B_TOGGLE_S_OFF:uint=21;
			,"Реплей менеджер"//ID_TEXT_REPLAY_MANAGER_WINDOW_TITLE:uint=22;
			,"Играть"//ID_TEXT_REPLAY_MANAGER_B_PLAY:uint=23;
			,"Стоп"//ID_TEXT_REPLAY_MANAGER_B_STOP:uint=24;
			,"Запись"//ID_TEXT_REPLAY_MANAGER_B_RECORD:uint=25;
			,"Класс"//ID_TEXT_MP_CLASS:uint=26;
			,"Доска"//ID_TEXT_WB_WINDOW_TITLE:uint=27;
			,"Онлайн"//ID_TEXT_MP_USERS_ONLINE:uint=28;
			,"Поднять руку"//ID_TEXT_MAIN_PANEL_B_HAND_UP:uint=29;
			
			,"Выбор цвета"//30
			,"Выбор толщины линии/размера шрифта"
			,"Рисование отруки"
			,"Линия"
			,"Окружность"
			,"Квадрат"//35
			,"Эллипс"
			,"Текст"
			,"Ластик"
			,"Отменить последнее действие"
			
			,"Добавить страницу"//40
			,"Удалить страницу"
			,"Очистить страницу"
			,"Предыдущия страница"
			,"Следующая страница"
			,"Загрузить сохраненную ранее доску"//45
			,"Сохранить доску"
			,"Удалить все страницы"
			,"Увеличить"
			,"Уменьшить"
			
			,"Опустить руку"//ID_TEXT_MAIN_PANEL_B_HAND_DOWN:uint=50;
			,'Отправить сообщение'//ID_TEXT_CHAT_SEND_BUTTON
			,'отображать/скрывать сообщения этого пользователя'//ID_TEXT_CHAT_BAN_BUTTON
			,'Предупреждение'
			,'Текущее разрешение экрана приложения не соответствует минимально допустимому\nМинимально допустимое разрешение: '
			,'пикселей'//ID_TEXT_PIXELS
			,'текущее разрешение:'//ID_TEXT_MIN_RESOLUTION_NOTIFICATION_CURRENT
			,'Ошибка'//ID_TEXT_ERROR
			,'Соединение потеряно\nобновите страницу'//ID_TEXT_DISCONNECTED_MSG_TEXT
			,'Соединение прервано\nпожалуйста подождите...'//ID_TEXT_SUSPEND_MSG_TEXT
			,'Выберите размер текста'//ID_TEXT_WB_SELECT_TEXT_SIZE
			,'Выберите толщину линии'//ID_TEXT_WB_SELECT_LINE_SIZE
			,'Выберите толщину линии/размер текста'//ID_TEXT_WB_SELECT_LINE_TEXT_SIZE
			,'Выберите цвет линии/текста'//ID_TEXT_WB_SELECT_COLOR
			,'Пожалуйста, подождите'//ID_TEXT_PLEASE_WAIT
			,'Лектора нет в классе,\nПожалуйста, подождите'//ID_TEXT_NO_LECTOR
			,'Микрофон не подключен'//ID_TEXT_HAS_NO_MIC
			,'Камера не подключена'//ID_TEXT_HAS_NO_CAM
			
		];
		
		public static const ID_TEXT_CHAT_WINDOW_TITLE:uint=0;
		public static const ID_TEXT_CHAT_CL_DEAR:uint=1;
		public static const ID_TEXT_CHAT_CL_INVISIBLE_USER_NAME:uint=2;
		public static const ID_TEXT_MAIN_PANEL_B_START:uint = 3;
		public static const ID_TEXT_MAIN_PANEL_B_START_TIP:uint = 4;
		public static const ID_TEXT_COURSE_LOADER_WINDOW_TITLE:uint=5;
		public static const ID_TEXT_PRESENTATION_LOADER_WINDOW_TITLE:uint=6;
		public static const ID_TEXT_PRESENTATION_LOADER_B_APPLY:uint=7;
		public static const ID_TEXT_PRESENTATION_LOADER_B_LOAD:uint=8;
		public static const ID_TEXT_VIDEO_WINDOW_TITLE:uint=9;
		public static const ID_TEXT_VIDEO_WINDOW_B_SETTINGS:uint=10;
		public static const ID_TEXT_VIDEO_CL_USER_NAME_IS_EMPTY:uint=11;
		
		public static const ID_TEXT_VIDEO_B_TOGGLE_V_IN_ON:uint=12;
		public static const ID_TEXT_VIDEO_B_TOGGLE_V_IN_OFF:uint=13;
		public static const ID_TEXT_VIDEO_B_TOGGLE_V_OUT_ON:uint=14;
		public static const ID_TEXT_VIDEO_B_TOGGLE_V_OUT_OFF:uint=15;
		public static const ID_TEXT_VIDEO_B_TOGGLE_AU_IN_ON:uint=16;
		public static const ID_TEXT_VIDEO_B_TOGGLE_AU_IN_OFF:uint=17;
		public static const ID_TEXT_VIDEO_B_TOGGLE_AU_OUT_ON:uint=18;
		public static const ID_TEXT_VIDEO_B_TOGGLE_AU_OUT_OFF:uint=19;
		public static const ID_TEXT_VIDEO_B_TOGGLE_S_ON:uint=20;
		public static const ID_TEXT_VIDEO_B_TOGGLE_S_OFF:uint=21;
		
		public static const ID_TEXT_REPLAY_MANAGER_WINDOW_TITLE:uint=22;
		public static const ID_TEXT_REPLAY_MANAGER_B_PLAY:uint=23;
		public static const ID_TEXT_REPLAY_MANAGER_B_STOP:uint=24;
		public static const ID_TEXT_REPLAY_MANAGER_B_RECORD:uint=25;
		public static const ID_TEXT_MP_CLASS:uint=26;
		public static const ID_TEXT_WB_WINDOW_TITLE:uint=27;
		public static const ID_TEXT_MP_USERS_ONLINE:uint=28;
		public static const ID_TEXT_MAIN_PANEL_B_HAND_UP:uint = 29;
		
		public static const ID_TEXT_WB_TOOL_0:uint = 30;
		public static const ID_TEXT_WB_TOOL_1:uint = 31;
		public static const ID_TEXT_WB_TOOL_2:uint = 32;
		public static const ID_TEXT_WB_TOOL_3:uint = 33;
		public static const ID_TEXT_WB_TOOL_4:uint = 34;
		public static const ID_TEXT_WB_TOOL_5:uint = 35;
		public static const ID_TEXT_WB_TOOL_6:uint = 36;
		public static const ID_TEXT_WB_TOOL_7:uint = 37;
		public static const ID_TEXT_WB_TOOL_8:uint = 38;
		public static const ID_TEXT_WB_TOOL_9:uint = 39;
		public static const ID_TEXT_WB_TOOL_10:uint = 40;
		public static const ID_TEXT_WB_TOOL_11:uint = 41;
		public static const ID_TEXT_WB_TOOL_12:uint = 42;
		public static const ID_TEXT_WB_TOOL_13:uint = 43;
		public static const ID_TEXT_WB_TOOL_14:uint = 44;
		public static const ID_TEXT_WB_TOOL_15:uint = 45;
		public static const ID_TEXT_WB_TOOL_16:uint = 46;
		public static const ID_TEXT_WB_TOOL_17:uint = 47;
		public static const ID_TEXT_WB_TOOL_18:uint = 48;
		public static const ID_TEXT_WB_TOOL_19:uint = 49;
		
		public static const ID_TEXT_MAIN_PANEL_B_HAND_DOWN:uint = 50;
		public static const ID_TEXT_CHAT_SEND_BUTTON:uint = 51;
		
		public static const ID_TEXT_CHAT_BAN_BUTTON:uint = 52;
		
		public static const ID_TEXT_MIN_RESOLUTION_NOTIFICATION_TITLE:uint = 53;
		public static const ID_TEXT_MIN_RESOLUTION_NOTIFICATION_TEXT:uint = 54;
		public static const ID_TEXT_PIXELS:uint = 55;
		public static const ID_TEXT_MIN_RESOLUTION_NOTIFICATION_CURRENT:uint = 56;
		public static const ID_TEXT_ERROR:uint = 57;
		public static const ID_TEXT_DISCONNECTED_MSG_TEXT:uint = 58;
		public static const ID_TEXT_SUSPEND_MSG_TEXT:uint = 59;
		
		public static const ID_TEXT_WB_SELECT_TEXT_SIZE:uint = 60;
		public static const ID_TEXT_WB_SELECT_LINE_SIZE:uint = 61;
		public static const ID_TEXT_WB_SELECT_LINE_TEXT_SIZE:uint = 62;
		public static const ID_TEXT_WB_SELECT_COLOR:uint = 63;
		
		public static const ID_TEXT_PLEASE_WAIT:uint = 64;
		public static const ID_TEXT_NO_LECTOR:uint = 65;
		
		public static const ID_TEXT_HAS_NO_MIC:uint = 66;
		public static const ID_TEXT_HAS_NO_CAM:uint = 67;
		
		
		
		
		public function get_TEXT_TIME_SS():String{return 'с';}
		public function get_TEXT_TIME_MM():String{return 'м';}
		public function get_TEXT_TIME_HH():String{return 'ч';}
		public function get_TEXT_TIME_DD():String{return 'д';}
		
		
		//} =*^_^*= END OF TEXT
		
		//{ =*^_^*= smart text
		public function getText(id:uint, args:Array):String {
			var t:String = '';
			switch (id) {
			
			case ID_TEXT_AGE:
				t = processText1(SMART_TEXT_TEXT_1, args[0], SMART_TEXT_TABLE_1);
				break;
				
			case ID_TEXT_CHAT_U_LOGGED_IN:
				t = processText(SMART_TEXT_TEXT_2, args);
				break;
				
			case ID_TEXT_CHAT_U_LOGGED_OUT:
				t = processText(SMART_TEXT_TEXT_3, args);
				break;
				
			}
			
			return t;
		}
		
		/**
		 * process numbers only
		 */
		private static function processText0(text:String, number:Number, table:Array):String {
			return text+table[number%10];
		}
		
		private static function processText1(text:String, tableKey:Number, table:Array):String {
			return text+table[tableKey];
		}
		
		private static const SMART_TEXT_TEXT_1:String = '';
		private static const SMART_TEXT_TEXT_2:String = 'Пользователь %0 присоединился к чату';
		private static const SMART_TEXT_TEXT_3:String = 'Пользователь %0 покинул чат';
		
	
		//лет
		private static const SMART_TEXT_TABLE_1:Array = [
			'лет',// 0
			'год',// 1
			'года',// 2
			'года',// 3
			'года',// 4
			'лет',// 5
			'лет',// 6
			'лет',// 7
			'лет',// 8
			'лет'// 9
		];
		
		public static const ID_TEXT_AGE:uint = 0;
		/**
		 * [String//username//]
		 */
		public static const ID_TEXT_CHAT_U_LOGGED_IN:uint=1;
		/**
		 * [String//username//]
		 */
		public static const ID_TEXT_CHAT_U_LOGGED_OUT:uint=2;
		//} =*^_^*= END OF smart text
		
		public static function helperHTML_Bold(a:String):String {
			return '<b>'+a+'</b>';
		}
		public static function helperHTML_Italic(a:String):String {
			return '<i>'+a+'</i>';
		}
		public static function helperHTML_BoldItalic(a:String):String {
			return '<b><i>'+a+'</i></b>';
		}
		public static function helperHTML_Color(a:String, color:String):String {
			return '<font color="#'+color+'">'+a+'</font>';
		}
		public static function helperHTML_Color_Bold(a:String, color:String):String {
			return '<font color="#'+color+'"><b>'+a+'</b></font>';
		}
		public static function helperHTML_Color_Italic(a:String, color:String):String {
			return '<font color="#'+color+'"><i>'+a+'</i></font>';
		}
		public static function helperHTML_Color_BoldItalic(a:String, color:String):String {
			return '<font color="#'+color+'"><b><i>'+a+'</i></b></font>';
		}
		
	}
}

//{ =^_^= History
/* > (timestamp) [ ("+" (added) ) || ("-" (removed) ) || ("*" (modified) )] (text)
 * > 
 */
//} =^_^= END OF History

// template last modified:15.01.2011_[00#08#13]_[6]