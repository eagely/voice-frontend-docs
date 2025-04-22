#set heading(numbering: "1.1")

= Results
All in all, the project was a success, every feature that was initially planned is implemented.

== Response Time
Concerning the low response times: For the frontend, there is nothing more left to optimize to achieve the 1 second goal.
Currently, responses take between `1.8 seconds` and `multiple minutes`, depending on which configuration is used;
running large machine learning models locally on a Raspberry Pi is a terrible idea and causes severe delays,
which is why every part of the system that requires a machine learning model offers either a cloud-based alternative,
or a simpler algorithm instead.
If ran with a powerful network connection and on powerful hardware, the system can theoretically achieve the goal response time of under `1 second`.

== User Interface
The final UI is shown below:

#figure(
  image("../assets/main.png", width: 100%),
  caption: [Final Main UI]
)

#figure(
  image("../assets/settings.png", width: 100%),
  caption: [Final Settings UI]
)

