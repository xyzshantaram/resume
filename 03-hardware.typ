#import "@preview/basic-resume:0.2.9": *
#import "lib/shared.typ": *
#import "lib/facts.typ": *

#show: resume.with(
  author: "Siddharth S Singh",
  accent-color: "#1a3f66",
  font: "New Computer Modern",
  paper: "a4",
  font-size: 7.8pt,
)

#show: airy.with(pdf: "Siddharth-Singh-Hardware-Engineer.pdf")

#contact(contact-items)

Hardware generalist. I have designed and fabricated PCBs, one of which ships in a product I sell. On
that product I ran the whole loop: parametric CAD, print-parameter tuning, assembly jigs, packaging,
and the firmware and backend behind it. My machining background is additive rather than CNC. I work
the build-measure-iterate loop across mechanical, electronics, and software, and I document and cost
what I build.

== Experience

PCB design+fabrication, firmware, and parametric CAD (OpenSCAD) work for various hardware projects.

#job("soapbox", bullets: ("stack", "lora", "signer"))

#job("attention-button", bullets: ("mechanical", "fixturing", "dfm", "electronics", "everything-else"))

*Other hardware.*

#fact-list("hardware", ("cardea", "pideck", "programmer"))

== Skills

#skills((
  ("CAD", [Parametric modelling in OpenSCAD (BOSL, MCAD, nutsnbolts). Assemblies, fixtures, tolerance and clearance fits, fillets, heat-set inserts, fasteners. Learning SolidWorks and Fusion 360.]),
  ("Manufacturing", [FDM process tuning (layer height, surface finish, batch plates), iterative prototyping, measurement and fit checking, BOM and cost analysis. CNC and CAM: familiar with the concepts, not yet hands-on.]),
  ("Electronics", [ESP32, ESP8266, rotary encoders, SPI displays, LoRa radios, sensor and module integration, bring-up and debugging. PlatformIO and the Arduino toolchain.]),
  ("Software", [Rust, C, C++, TypeScript, Python, Lua. Firmware, desktop, backend, and web. Linux, Docker, git.]),
  ("Working style", [Hands-on, high ownership, used to being the only person responsible for a thing working. Based in Bangalore and happy on a factory floor.]),
))

== Education

#fact-edu()

- *Best Capstone project of 2024* in the Electrical and Electronics Engineering department, VIT
  Chennai — #link("https://shantaram.xyz/misc/rev3_slides_final.pdf")[pideck], a handheld modular computer.

== References

#refs
