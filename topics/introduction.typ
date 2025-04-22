#set heading(numbering: "1.1")

= Introduction and System Overview
This project aims to implement a frontend application for a voice assistant designed primarily for Raspberry Pi hardware,
while maintaining compatibility with other Linux/Unix-like systems.
It is developed in parallel to a diploma thesis which encompasses the backend of the voice assistant,
as well as a hardware setup for it.

== Project Scope
The following are the main objectives of the frontend:
- Audio playback of responses from the server
- The ability to start recording using either a button or a wake word
- A user interface for configuration
- Efficient communication between client and server, with a target response time of under 1 second

== Background and Motivation
Voice assistants have experienced steady adoption growth,
though they are often regarded as supplementary rather than essential tools.
This project seeks to address this limitation
by developing a voice assistant solution that could enhance users' workflows
while maintaining minimal intrusiveness.
The implementation focuses on extending traditional voice assistant capabilities
with advanced features such as workspace management and unrestricted configuration.

== Technical Challenges
The development process was expected to encounter several technical challenges, including but not limited to:
- Voice Activation: Implementing an effective voice activation solution requires a powerful wake word detection engine that works flawlessly.
- Security: Workspace Management may involve opening applications, in which case prevention of arbitrary code execution is a concern.
- User Experience: This includes minimal response times, clear feedback, and an accessible and visually appealing interface.
- Low Latency: Ensuring a response time of under 1 second requires careful design of communication, ensuring that large data packets are transferred
in streams and audio is played immediately upon availability without having to wait for all the data to arrive.

== Choice of Framework
Several frontend frameworks were considered initially. These include:
- Vue.js#footnote[Vue.js web frontend framework @vuejs]
- Godot#footnote[Godot game engine @godot]
- Qt#footnote[Qt framework @qt]
- SDL#footnote[Simple DirectMedia Layer library @sdl]
- Low-Level Graphics#footnote[Adafruit TFTLCD library @adafruit-tftlcd]

Initially, `Vue.js` and `Godot` were considered due to prior experience with them.
However, given that the voice assistant would run on a Raspberry Pi
where performance is crucial for ensuring a smooth user experience,these options were ruled out.
While something akin to `SDL` or more low-level graphics was an option, their steep learning curve made them impractical choices.
Ultimately, `Qt` was selected for its robust performance, extensive industry adoption, and comprehensive documentation.

== Qt Framework
The Qt framework is a comprehensive toolkit designed for creating cross-platform applications
with a focus on performance and user experience.
It is particularly well-suited for projects that require a responsive and visually appealing interface,
such as the voice assistant frontend described in this documentation.
This section provides an overview of the key components and concepts of the Qt framework,
including qmake, signals and slots, Qt Creator, and .ui files.

=== qmake
qmake is the build system tool used by Qt to manage the compilation and linking of applications.
It simplifies the build process by automatically generating Makefiles based on project files (.pro).
A typical .pro file includes information about the source files, headers,
and other resources needed for the project. Here is an example of a simple .pro file:

```
TEMPLATE = app
TARGET = myapp
QT += core gui
```

The .pro file specifies that the project is an application (TEMPLATE = app),
the target executable is named "myapp", and it uses the Qt core and GUI modules.
Additional elements like source files, headers, and forms can be specified in similar fashion.

=== Signals and Slots
One of the most powerful features of Qt is its signals and slots mechanism,
which facilitates communication between objects.
Signals are emitted when a particular event occurs,
and slots are functions that respond to these signals.
This mechanism allows for a flexible and decoupled design.

The following example demonstrates connecting a button's click signal to a label's text update slot:

```
connect(button, &QPushButton::clicked, label, &QLabel::setText);
```

In this example, the QPushButton's clicked signal is connected to the QLabel's setText slot.
When the button is clicked, the label's text is updated accordingly.

=== Qt Creator and .ui Files
Qt Creator is an integrated development environment specifically designed for Qt development.
It provides comprehensive tools for code editing, debugging, and UI design.
The integrated UI editor allows developers to create and arrange widgets using a visual interface,
generating .ui files that represent the UI layout in XML format.
