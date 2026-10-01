#import "@preview/basic-resume:0.2.9": *
#import "lib/shared.typ": *

#show: resume.with(
  author: "Siddharth S Singh",
  accent-color: "#1a3f66",
  font: "New Computer Modern",
  paper: "a4",
  font-size: 7.8pt,
)

#show: airy.with(pdf: "Siddharth-Singh-Hardware-Engineer.pdf")

#contact((
  ("pin", "Bangalore, India", ""),
  ("mail", "me@shantaram.xyz", "mailto:me@shantaram.xyz"),
  ("github", "xyzshantaram", "https://github.com/xyzshantaram"),
  ("globe", "shantaram.xyz", "https://shantaram.xyz"),
))

Hardware generalist. I have designed and fabricated five PCBs, one of which ships in a product I
sell. On that product I ran the whole loop: parametric CAD, print-parameter tuning, assembly jigs,
packaging, and the firmware and backend behind it. My machining background is additive rather than
CNC. What I bring is the build-measure-iterate loop across mechanical, electronics, and software,
and the discipline to document and cost it.

== Hardware Engineering

#work(
  title: "Founder and sole engineer",
  company: "The Attention Button — an IoT desk toy, designed and sold",
  location: "Bangalore",
  dates: "2023 — Present",
)
- *Mechanical design.* Designed the chassis, lid, knob, and internal structure as parametric
  OpenSCAD models, using BOSL, MCAD, and `nutsnbolts` for fillets, rails, and bolt and
  heat-set-insert geometry. Named constants drive it, so one change propagates to the assembly.
- *Fixturing.* Designed a dedicated *assembly jig* for seating the rotary encoder repeatably,
  then revised it once the first version proved awkward on the bench. Rails, nubs, and snap
  features were dimensioned around real measured fits, not nominal ones.
- *Design for manufacture.* Iterated the chassis across roughly *55 STL revisions* to v12 and a
  pre-production part. Ran print-parameter studies for layer height and surface roughness, then
  produced *batch plates for 1, 2, 5, and 9 parts* with slow-quality profiles for the production
  run. That is 33 sliced programs of deliberate process tuning.
- *Electronics and firmware.* Designed the board in EasyEDA around an ESP-12F, a rotary encoder,
  and a MAX7219 LED matrix, and wrote the firmware in C++ on PlatformIO and Arduino, with LittleFS
  storage, a captive-portal Wi-Fi setup flow, and MIDI playback.
- *Everything else shipping requires.* Backend, website, an illustrated instruction booklet, and
  a packaging-layout generator. Sold to customers, with the hardware and design files open.

#work(
  title: "PCB design",
  company: "Five boards designed, fabricated, and assembled — schematic through layout and BOM, in EasyEDA",
  location: "",
  dates: "2023 — 2026",
)
- *cardea* — a Trezor Model 1 recreation moved to USB-C. STM32F205RET6, SSD1306 OLED, two
  buttons, ESD array and a resettable polyfuse on the USB input.
- #link("https://gitlab.com/soapbox-pub/hardware-signer")[*Soapbox hardware signer*] — an ESP32-WROVER-E NIP-46 signer with a 2.4-inch ILI9341 TFT and a
  six-button pad with physical confirm and cancel, so each signature is approved on the device. I
  wrote its firmware too: display bring-up, on-device UI, Wi-Fi provisioning, and a scripting layer.
- #link("https://github.com/theattentionbutton")[*The Attention Button*] and #link("https://shantaram.xyz/misc/rev3_slides_final.pdf")[*pideck*] — the boards inside the two products described here.
- *CH340G USB programmer* — the production programmer I built to flash Attention Button units
  during assembly. Its header mates with one I designed onto the product board. Alongside these,
  LoRa mesh work over Web Serial and Web Bluetooth.

#work(
  title: "pideck — handheld modular computer",
  company: "Final-year project, VIT Chennai, team of three",
  location: "",
  dates: "2024",
)
- An open, extensible classroom handheld between a calculator and a tablet. I designed the carrier
  board integrating a Raspberry Pi Zero W, a 3.5-inch LCD, a matrix keypad, TP4056 charging from
  an 18650, an MT3608 boost stage, and LM386 audio, drawing custom footprints for each module.
- Wrote the keyboard matrix driver in C against the Linux 6.1 kernel on Raspberry Pi OS, plus the
  launcher, a quiz app, and inter-device communication.
- Produced the full *BOM and cost analysis*: 3,931 INR per unit against a 3,325 INR budget, 15
  percent over, itemised to the resistor. Built three working units and documented the failure
  modes we had not solved, mainly battery configuration and thermal performance.

== Software

#work(
  title: "Software Engineer (contract)",
  company: "Soapbox · earlier Fractional Finance and Ready Cloud Consulting",
  location: "Remote",
  dates: "2019 — Present",
)
- I write production Rust, C, C++, TypeScript, and Python. I have shipped a sandboxed runtime, a
  desktop daemon, and device firmware, so I build the tooling and the operator interface around a
  machine myself.

== Skills

#skills((
  ("CAD", [Parametric modelling in OpenSCAD (BOSL, MCAD, nutsnbolts). Assemblies, fixtures, tolerance and clearance fits, fillets, heat-set inserts, fasteners. Learning SolidWorks and Fusion 360.]),
  ("Manufacturing", [FDM process tuning (layer height, surface finish, batch plates), iterative prototyping, measurement and fit checking, BOM and cost analysis. CNC and CAM: familiar with the concepts, not yet hands-on.]),
  ("Electronics", [ESP32, ESP8266, rotary encoders, SPI displays, LoRa radios, sensor and module integration, bring-up and debugging. PlatformIO and the Arduino toolchain.]),
  ("Software", [Rust, C, C++, TypeScript, Python, Lua. Firmware, desktop, backend, and web. Linux, Docker, git.]),
  ("Working style", [Hands-on, high ownership, used to being the only person responsible for a thing working. Based in Bangalore and happy on a factory floor.]),
))

== Education

#edu(
  institution: "VIT Chennai",
  location: "Chennai, India",
  dates: "2020 — 2025",
  degree: "B.Tech, Electrical and Electronics Engineering",
  consistent: true,
)

== References

#refs
