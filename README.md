
разрешение на публикацию данного кода было получено либо код не находился под NDA либо уже более не находится под NDA тоесть я могу его показать не нарушая соглашений о коммерческой тайне.

# Содержание:
1 обзор проекта

2 описание кода/архитектуры, навигация по коду

## 1 обзор проекта


Образовательная платформа вебинаров "Tutorion" предназначена для преподавателей и репетиторов. Платформа имеет все необходимые преподавателю инструменты, включая USB ручку для рисования на виртуальной доске

Функционал:
- Видео/аудио конференция
- Виртуальная доска с возможностью рисования произвольных фигур, ввода текста, загрузкой документов и изображений
- С помощью специальной физической шариковой ручки подключаемой по USB, изображения и текст, введенные преподавателем на бумаге, копируются на виртуальную доску


## Видеообзор проекта

функционал:

https://www.youtube.com/watch?v=PDGOWsa32os

промо ролик прокта:

https://rutube.ru/video/237458209c1a06ba3f29a8e42fd26333/


Задачи:

- Разработка клиента с нуля (полный рефакторинг не рассматривался изза ограничений архитектуры и низкого качества существующего кода): от архитектуры до элементов интерфейса
    
- Реализация возможности записывать вебинар и воспроизводить его позже с произвольным выбором времени. формат записи: json, аудио и видео(с вебкамеры)
    
- Конкурентная разведка с целью наращивания и улучшения дизайна и функционала
    
- Доработка и улучшение существующего дизайна


Языки программирования: ActionScript 3.0

Фреймворки: ASwing, архитектура: собственный фреймворк (мультиагентные системы, паттерны проетирования)




## 2 описание кода/архитектуры, навигация по коду


предоставленный код - код проекта "Tutorion"

\tutorion\TTCC\TTCC\TTCC.as3proj файл проекта FlashDeveloper  

\tutorion\TTCC\docs\*  
\tutorion\TTCC\docs\Project TTCC.pdf  
некоторая документация по архитектуре  

логгирование состояния и событий приложения в консоль. сообщение имеет уровень(INFO WARNING ERROR) и имя компонента.  
\tutorion\TTCC\TTCC\src\ttcc\LOG.as


"входная точка" проекта  
\tutorion\TTCC\TTCC\src\ttcc\main\Main.as  
строка "app = new Application(this, new AppComponentsList());"

код, мною не написанный  
\tutorion\TTCC\TTCC\src\ttcc\third_party\*


\tutorion\TTCC\TTCC\src\org\aswing  
порт фреймворка Java Swing на ActionScript 3. это кастомная версия - я убрал баги

мои различные хелперы и фреймворки  
\tutorion\TTCC\TTCC\src\org\jinanoimateydragoncat\  
концепция которую я создал по идее агентно ориентированного программирования  
\tutorion\TTCC\TTCC\src\org\jinanoimateydragoncat\utils\flow\agents  
концепция операций с кодом завершения. позднее я от нее отказался(детали ниже)  
\tutorion\TTCC\TTCC\src\org\jinanoimateydragoncat\utils\flow\operations


строка 69  
создается отдельная среда и агент для подготовки приложения к запуску. после запуска приложения используется другая среда с другим набором агентов находящейся в ней.  
\tutorion\TTCC\TTCC\src\ttcc\Application.as

в этом пакете все что связано с контролем  
\tutorion\TTCC\TTCC\src\ttcc\c\

кастомные среды агентов (конкретно для этого проекта)  
\tutorion\TTCC\TTCC\src\ttcc\c\ae

"операции" у каждой код завершения либо success либо error. позднее я отказался от этой концепции. вместо нее в среде размещались данные о состоянии target и агенты анализируя эти данные принимали решение о том что делать дальше чтобы привести ее к нужному состоянию либо просто реагировали на изменение состояния среды.  
\tutorion\TTCC\TTCC\src\ttcc\c\op\*


в этом пакете находятся менеджеры котоорые управляют компонентами(модулями) приложения например чат доска файл менеджер видео итд.  
\tutorion\TTCC\TTCC\src\ttcc\c\ma\ac

в этом пакете находятся менеджеры следующего уровня иерархии. они управляются менеджерами из вышеупомянутого пакета. каждый такой модуль инкапсулирован его можно скопировать в другое приложение  
\tutorion\TTCC\TTCC\src\ttcc\c\ma

менеджеры (агенты) управляющие компонентами вида приложения. эти менеджеры самого верхнего уровня иерархии. они организуют работу более узкоспециализированных менеджеров(менеджеры составляющие компоненты). каждый такой компонент можно вытащить из проекта и внедрить в новый без измениня кода.  
\tutorion\TTCC\TTCC\src\ttcc\c\vcm

это менеджер реплей режима. в этом режиме все состояние модели приложения воспроизводится. это было сделано чтобы заменить видеозапись с экрана. при воспровизведении кнопки сами нажимаются итд как будто это видеозапись.  
\tutorion\TTCC\TTCC\src\ttcc\c\ma\MReplay.as



в этом пакете все что связано с данными  
\tutorion\TTCC\TTCC\src\ttcc\d\

value objects приложения (DataUnit)  
\tutorion\TTCC\TTCC\src\ttcc\d\a

обработчики данных(data processor)  
\tutorion\TTCC\TTCC\src\ttcc\d\dp

data storage processors  
\tutorion\TTCC\TTCC\src\ttcc\d\dsp

модели данных с методами read & write  
\tutorion\TTCC\TTCC\src\ttcc\d\m

объекты данных которые используются для коммуникация с сервером  
\tutorion\TTCC\TTCC\src\ttcc\d\s

объекты данных которые используются в View data flow  
\tutorion\TTCC\TTCC\src\ttcc\d\v




в этом пакете все что связано с сетью  
\tutorion\TTCC\TTCC\src\ttcc\n\

в этом пакете все что связано с видом  
VCMainScreen.as - код главного экрана приложения  
в пакете есть подпакеты для каждого компонента:  
av - аудио видео  
chat  
cl загрузчик курсов  
mp - главная панель приложения  
pl - лоадер презентаций  
r - реплей менеджер(все действия курса записываются и потом можно воспроизвести все события(нажатие кнопок рисование на доске пауза видео итд)  
wb - whiteboard доска на которой можно рисовать  
\tutorion\TTCC\TTCC\src\ttcc\v\


конфигурация приложения  
\tutorion\TTCC\TTCC\src\ttcc\cfg\

нет юнит тестов. не использую тестирование код разделен на слабосвязанные изолированные части.

эта архитектура была также портирована на js и php. собрал на этой базе свой фреймворк для RESTful приложений

данные конкурентной разведки(собрано мною)  
\tutorion\обзоры платформ\*

