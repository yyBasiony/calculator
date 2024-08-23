# calculator

A new Flutter project.
## Linke
https://github.com/yyBasiony/calculator.git
### Image
![Ui](https://github.com/yyBasiony/calculator/raw/main/assets/Screenshot%202024-08-23%20144745.png)

#### Scaffold

    A basic structure for visual elements in the app.
    Provides the structure for the SplashScreen and HomePage.
         return Scaffold(
      ),

##### Center

    Used to center the child widget (the app icon) inside the splash screen.
            body: Center(
          child: Text(
            '',
            style: TextStyle(fontSize: 10),
          ),
        ),



###### CircleAvatar

 Displays a circular image. It's used in the splash screen for the app logo.
           child: CircleAvatar(
            radius: 50, 
          ),


####### Future.delayed

      Delays the transition from the splash screen to the home screen for 3 seconds.
        void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
    });
  }

######## Navigator.pushReplacement

   Replaces the current screen with the home screen after the splash screen duration.
         Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );


 ######## Padding
 
           Adds spacing around the elements, especially around buttons and text.
                      padding: EdgeInsets.all(16.0), 


########### Column

 Used to vertically arrange the widgets in both the splash and home screens.
             body: Column(
          children[
            Container(
              color: Colors.orange,
              height: 100,
              child: Center(child: Text('')),
            ),

    Used in the calculator layout to display buttons in a horizontal arrangement.
             body: Row(
          children[
            Container(
              color: Colors.orange,
              height: 100,
              child: Center(child: Text('')),
            ),


########## ElevatedButton

   Used to create the calculator buttons, with custom styles such as rounded or rectangular shapes.
    ElevatedButton.icon(
  onPressed: () {},
  icon: Icon(Icons.thumb_up),
  label: Text('Like'),
),

########### Text

    Displays the result of the calculator and labels for the buttons.
    Text(""),

########## Expanded

    Expands the button widgets to take up available space in the Row.
    Expanded(
      child: Container(color: Colors.orange),
    ),


########### CircleBorder 

    Used to define the shape of the buttons (circular or rectangular).
                decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 5),
            ),



