= Planning

Planning is vital to any project, as it establishes a clear path towards success; while one always needs to be creative along the way, a well‑established plan helps ensure that the final goal is clear and attainable. Setting clear goals allows the team to allocate resources properly, which includes identifying potential risks, such as exam periods along the way where the team does not have much time to work on the diploma thesis. Nonetheless, remaining flexible is of utmost importance, as unexpected things could happen in life, which may inhibit the team’s ability to work for a period of time.

== Milestones

Accounting for all previously mentioned points, a plan was established with clear milestones, which would be adjusted along the way to ensure full completion was possible and there were no periods of extended inactivity.

#table(
  columns: 2,
  [*Milestone*], [*Date*],
  [Backend set up and speech recognition functions], [2024‑10‑04],
  [Functioning software prototype (e.g., weather querying)], [2024‑11‑01],
  [Hardware and software communication functioning], [2024‑12‑13],
  [Interface with LLM], [2025‑01‑31],
  [Final prototype completed], [2025‑02‑28],
)

== System Architecture

The project is separated into a frontend and a backend, where the frontend handles user interaction and experience, while the backend processes audio, turning it into the proper assistant output (text, generated audio, or an action on the system).

=== Client‑Server Architecture

In the following flowchart, the frontend is depicted as the client and the backend as the server, communicating via a protocol to be decided based on fit.

#figure(
  image("../assets/architecture-pre.png", width: 100%),
  caption: [Client‑Server Architecture],
)

The system starts with the backend listening for connections, and the client connecting to the backend. Multiple clients may connect simultaneously. Once a client has connected, it records audio (via buttons or wake word + silence detection), sends it to the server, and the server processes it—this is the event loop of the system.

=== Configuration
The client can send configuration commands selected from a menu and saved in a backend file. TOML#footnote[Tom’s Obvious, Minimal Language @toml] would be a great option because it supports simple table‑key‑value splits for different system parts, while still storing arbitrary key‑value pairs.

=== Microservices
To avoid a monolith, microservices will be used for each part of the system on the backend.
The next figure shows how audio and configuration requests flow through these services.

#figure(
  image("../assets/processing-pre.png", width: 100%),
  caption: [Processing of audio],
)
