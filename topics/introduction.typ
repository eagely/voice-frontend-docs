#set heading(numbering: "1.1")

= Introduction and System Overview

This project implements a frontend application designed primarily for Raspberry Pi hardware,
while maintaining compatibility with other Linux/Unix-like systems.
Developed as an extension to an existing voice assistant diploma thesis,
it focuses on providing a user-friendly interface for audio capture and processing through backend services.

== Project Scope
The project scope encompassed the following objectives:
- Implementation of efficient backend communication, with a target response latency of 1 second
- Development of response playback functionality, offering both textual and audio output modalities
- Integration of multiple input methodologies, including text input, push-to-talk, and voice activation modes


== Background and Motivation
Voice assistants have experienced steady adoption growth,
though they were often regarded as supplementary rather than essential tools.
This project sought to address this limitation
by developing a voice assistant frontend solution that could enhance users' workflows
while maintaining minimal intrusiveness.
The implementation focused on extending traditional voice assistant capabilities
with advanced features such as workspace management and speech-to-text integration.

== Technical Challenges
The development process was expected to encounter several technical challenges, including but not limited to:
- *Voice Activation:* Implementing an effective voice activation system necessitates continuous listening capabilities. This can be achieved either through a wake-word detection mechanism or an advanced language model that can discern commands from regular speech. Both approaches require careful consideration of computational efficiency and responsiveness.
- *Security:* The ability to execute arbitrary commands poses a significant security risk. It is imperative to implement strict access controls and validation mechanisms to prevent unauthorized actions and protect the user from potential threats posed by malicious actors.
- *User Experience:* Ensuring a seamless and intuitive user experience is vital for the adoption of the voice assistant. This includes minimizing response times, providing clear feedback, and designing an accessible and user-friendly interface.
- *Low Latency:* Ensuring efficient communication with the backend is essential to achieve the goal of response delays no longer than 1 second on a Raspberry Pi. While most of the heavy lifting is done by the backend, communication protocols still need to be optimized to ensure low latency.

== Choice of Framework
Several front-end frameworks were considered initially. These include:
- Vue.js#footnote[Vue.js web frontend framework @vuejs]
- Godot#footnote[Godot game engine @godot]
- Qt#footnote[Qt framework @qt]
- SDL#footnote[Simple DirectMedia Layer library @sdl]
- Low-Level Graphics#footnote[Adafruit TFTLCT library @adafruit-tftlcd]

Initially, `Vue.js` and `Godot` were considered due to prior experience with these frameworks. However, given that the voice assistant frontend would run on a Raspberry Pi where performance is crucial for ensuring a smooth user experience, these options were ruled out. While low-level frameworks like `SDL` and `Embedded Graphics` were available, their steep learning curve and limited industry adoption made them impractical choices. Ultimately, `Qt` was selected for its robust performance, extensive industry usage, comprehensive documentation, and the fact that it's the framework that is used by my desktop environment (KDE Plasma), so it would have seamless integration with my personal system.


== System Architecture
The complete voice assistant consists of two parallel projects: this Qt-based frontend and a Rust backend being developed as an ongoing diploma thesis. The frontend serves as the user interface layer, providing efficient access to the backend's voice processing capabilities.

#figure(
  image("../assets/stackchart.png", width: 100%),
  caption: [System architecture showing the Qt frontend (current project scope) and the Rust backend components (parallel diploma thesis). The processing pipeline flows from the frontend through various backend stages, each offering multiple implementation options.]
) <system-architecture>

=== Frontend
The Qt-based frontend layer handles:
- User interface and interaction
- Audio recording control
- Communication with backend
- Result presentation

=== Backend
The backend system, currently under development, comprises several processing stages:
- *Recording Stage:* Implements both local and remote recording capabilities:
  - Local Recorder for direct hardware access
  - Remote Recorder for distributed setups
- *Transcription Stage:* Provides multiple transcription options:
  - Local Whisper for offline processing
  - Cloudflare Whisper for edge computing
  - OpenAI Whisper for cloud-based processing
- *Processing Stage:* Implements various NLP options:
  - Local NLP for offline processing
  - Remote NLP for distributed processing
  - Cloudflare NLP for edge computing
  - OpenAI NLP for advanced language models
  - Regex Matcher for simple pattern matching
- *Output Stage:* Handles the final processing results

The modular architecture enables flexible deployment configurations. Users can choose between local processing for privacy-conscious applications or cloud-based processing for enhanced capabilities, with the frontend adapting seamlessly to either choice.



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
