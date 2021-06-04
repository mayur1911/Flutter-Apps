/*


Types : Types are data types in dart
        Every user input have some type which is data type
        string, num ( parent of double and int)

Every value in dart is Object

Variables : any not specific data typed value can be declared using 'var' keyword
            var age = 25  OR  int age = 25
            'var' tells age is variable
            if you are

Properties : Class variables which can be accessed in class and declared in class are called
             properties.
             properties are also called as 'instance field'
          
Methods :   Functions defined in class are called Methods



What are named arguments in constructor in dart.
Scaffold does NOT take positional arguments


/-----------------/

-- In main.dart file, app is started to load through MaterialApp Widget
   return MaterialApp ( home : widget class to display as 1st home screen page)
                      ( Generally : MyHomePage())

Ways of creating constructors :
  - types : Named arguments       ({this.arg1,this.arg2})
            Positional arguments  (this.arg1,this.arg2)
    Creating object :   classname(arg1 : 120, arg2 : 150) -- named args
                        classname(120, 150)               -- positional args

class Person{

  Person.old(this.name){
    age = 50
  }
}

p1 = Person.old('shubham')
-- it will default set age = 50

What is enum :
-->  Enum is value where you can choose 1 value from choices and it is chosen 
      in human readable format or labels which are mapped to integers

-- null : can be assigned to any data type if None value is present to assign


Container vs Column & Row :
- Container :
    - ONLY one child widget
    - more styling & alignment attributes
    - Flexible width, heights, various widths
    - Perfect for custom effects

- Column/Row :
    - Multiple child widgets
    - NO styling options, ONLY alignement
    - Takes full available width
    - To apply attributes, must have widgets abovve or below
    - To add scroll to column, it has to be wrapped in scrollchildscrollview widget
    - To set scroll to particular height window, it has to be wrapped in Container
    - As Container has height & width, BUT column dont have

-- ListView :
    - ListView is column with infinte height BUT, 
    - Column takes the maximum available height
    - ListView is NOT required to wrap ScrollChildScrollView, it has by default scroll
    - ListView has 2 forms :
        - ListView( children []) : it loads & renders all elements of column both visible & invisible on screen
        - ListView.builder() : Loads only elements which are visible to have good performance & memory efficient use 
        - in ListView.builder(
          itemBuilder :(context index) {
            return AnyWidget()
          },
          itemCounter : length of list 
        )


onSubmitted : (_) => functionName
-- Here, onSubmitted requires 1 argument , BUT if we dont require to pass any 
         value to function, we pass (_)
    
-- Stateful vs Stateless widget :
    - Any data in stateless gets lost after each new tap, to have data on screen , use stateful class
    
    - In case of stateful class, it has 2 classes :
      1st is widget class
      2ns is state class
    - To access widget class variables, functions in state class, 
          use widget.variable_name;
              widget.function_name

-- Getters & Setters in dart :
  - They are class methods or called properties which are used to manipulate class data
  - getters to get class data & setters to set class data
  -  return-type get class-field{

                                }
        


--  FittedBox  :  It restricts the compoenent inside it, to be that available space ONLY, it dont overlap with other widget
--  SizedBox   :  It is used to add blank space with specified sizes, in between LINED widgets
--  Stack      :  It allows to add mutliple widgets one over another, at same place
--  Flexible (fit)  :  tight or loose --> If it is loose. it will shrink its size to give space to other component if needed, 
                       here to the label text
             (flex) : widget1 - flex : 1 , widget2 - flex : 2 -- > will give space to [ widget1 - 1/3 & widget2 - 2/3 ]
--  Expanded   :  It is same as Flexible ( fit.tight ) by default,   it takes flex values only


-- CircleAvatar : instead of circle-avatar , Container can be used with BoxShape in BoxDecorarion of decoration

-- **  In List [ if( condition ) statement ]       Here, { } curly braces are not required for body, direct is allowed

-- MediaQuery.of(context) --  gives all info about a deviece sizing, orientation, FOR a particular device
                          -- MediaQuery.of(context).size.height
                          -- MediaQuery.of(context).orientation
                          -- MediaQuery.of(context).viewInsets.bottom   -- it gives how much bottom distance is covered by softKeyboard or any other component
                          -- MediaQuery.of(context).viewPadding

-- Scroll :
           -- SingleChildScrollView : it gives scrolling for its child widget

-- ** iOS apps :
               - For iOS apps, there are certain widgets, whos UI is diferent from Android UI,
                 So, to add them, following syntax is used.
                  Andoid :  Widget_Name()
                  iOS    :  Widget_Name.adaptive()

-- Execution of BUILD method by flutter :

  - There are 3 types of trees :
        - Widget Tree   ( build()  method called frequently )
        - Element Tree  ( build()  method called rarely )
        - Render Tree   ( build()  method called rarely )

    - Element Tree has 'state' which determines the weather to call build method or NOT
    - if setState is called, it automatically calls Element tree OR Render tree

  - build() method called by various reasons:
      - setState()
      - softkeyboard 
      - MediaQuery  [ so if any changes in orientation, size regarding device page]
          :- As in Bigger or Complex apps , we divide app into multiple widgets,
             So, to get good performance MEDIAQUERY should NOT be called frequently
             So, try to avoid MediaQuery in main.dart 
  - Use of const for variables and constructors :
      - build() method always create Widgets , new every time, to lags the performance,
      - So, objects are created everytime in these widgets,
      - BUT, if we know any Widget which never going to change,
      - use 'const' word before that. 
   

-- Spread Operator :  ParentList[ item1, ...subList, item2 ]       
                   Here ... spread operator used (JavaScript) to get elements from inner list 
                   And put them as individual elememts in Parent List

-- WIDGET LifeCycle :
      - Stateless Widget : Constructor function --> build()
      - Stateful Widget  : Constructor function --> initState() --> build() --> setState() -->
                           didUpdateWidget() --> build() --> dispose()
                           - initState() is called once only when 'State' object is created, 
                             But widgets are created multiple times, so build() also called multiple times.
                           - super.initState() is NO need to be written at Start, BUT it matters only in "Debugging"

                           @override
                            void initState() {
                              // Here, we can retirve data from database
                              // load HTTP protocols
                              print("initState()");
                              super.initState();
                              Here, Flutter recommend to initiliase super.initState() at begining, 
                              BUT it affects only for Debugging
                            }

                            // didUpdateWidget() is rarely used
                            // it is used when there is change in parent state due to new addtional data from database

                            // it is used when data is coming through live server
                            // if widget is NOT more required so get destroyed,
                            // so information / data attached with That widget is NOT so required to store in memory, SO dispose()

-- APP LifeCycle :
    - App Lifecycle has various states :
    - inactive  : app is NEITHER visible to user NOR running in background
    - pause     : app is NOT visible, BUT running in background
    - resume    : app is visible and running also and responding to user
    - suspending: app is about to supend ( exited )

-- builder()  methods always return a new widget always !!!
              - they always demand context as argument
              - every widget has its context ( context is element of widget in element tree )
              - context - is skeleton of widget tree, how widgets are related,
              - And context is Meta-Informaton of the widget and its location on widget tree.abstract
              - use builder() method if length or size is dynamic for list or simialar widget


-- Inherited Widget : In any app, data may need to fetch or write from 1 widget to another widget which may be too far from
                      it in widget tree, or may be on other pages, SO by trandiotnal approch it is done by passing arugemets
                      through constructor of every widget that is come on way.
                      It makes it too cumbersome, to avoid that Inherited Widget is used

-- Key : Key is set on top most widget of parent widget to identify that partuculat instance from other instances
        - Generally  while dealing with List where no element is at fix position or index Key is used
        -- Types of keys :
              - UniqueKey()  : it is unique & generated by flutter @ every build method calling, 
                               So avoid this key if we DONT want to loose previous widget data, 
                               As every build() call create new instance of widget
              - ValueKey()   : User can set any key, NOT auto generated

-- GridView : 
            - sliver : it is scrollable area

-- GestureDetector    : This widget has many attributes for tap and its behaviour REPLACEMENT for button

-- InkWell            : Same as GestureDetector with Ripple wave effect. 


-- Navigation through Pages:

      - Navigator.push(ctx, MaterialPageRoute( builder: (_) { return CategoryMealScreen(id, title, recipie); }, ),
      - Navigator.pushNamed(routeName);
         -> pushNmaed()   return a object called <Future> that allows to specify functions to occure after doing some operation,
                          SO, here function calling DO-NOT onTap to call , it is achived by following way
            pushNamed().then( (argument_variable) { code to execute after executing pushNamed function   } )
            argument_variable : is from arguments associated with pushNamed funcion
      - Navigator.pushReplacementNamed (routeName);   It will destroy the previous page then form new page, 
                                                      so stack of page will NOT overflowed
      - Navigator.of(context).pop()   : it takes out the current page behind other page OR makes it disappear NOT delete.
      - Navigator.of(context).canpop() -> return bool - tells whether is there any page behind that can be loaded after poping this out

                      

-- Writing clean & good code :
      - Use 'const' keyword for widgets, variables which are NOT going to change at all 
      - use builder() method if length or size is dynamic for list or simialar widget

****-----------CHECK OUT THIS FUNCTIONS-----------****

- showModalBottomSheet()
- showBottomSheet()
- what is Covariant







*/
