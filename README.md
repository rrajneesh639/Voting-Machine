I implemented a voting machine using Verilog with the following features:

### Features:
1. **Candidate Buttons**: The top block contains four buttons, each representing a candidate.
2. **Reset Button**: A reset button to clear all data.
3. **Mode Button**: A mode button with two modes:
   - **Mode 0**: Records votes.
   - **Mode 1**: Displays the number of votes each candidate received.

### Blocks:
1. **Top Block**: Instantiates:
   - **Button Block**: Manages the button inputs.
   - **Reset Block**: It can reset all data stored.
   - **Mode Block**: Controls whether votes are recorded or displayed.

### Voting Mechanism:
- **Single Vote Recording**: Prevents pressing multiple buttons simultaneously. If multiple buttons are pressed, it records the vote of the button pressed first.
- **Vote Confirmation**: Votes are recorded only if the vote button is pressed for a certain duration, indicated by all LEDs blinking for a second.

### Simulation:
- **Tools Used**: Icarus Verilog and GTKwave for simulation and waveform analysis.

### Improvement Plan:
- **Top Block Optimization**: 
   - Current Design: The top block contains reset and mode buttons.
   - Future Design: The top block will only contain vote buttons and LEDs, with reset and mode as ports.
   - **Interoperability**: This allows the top block to connect to another top block containing reset and mode buttons, enabling usage for counting purposes only.

### Snapshot:
- A snapshot of the waveform from the simulation using GTKwave is available for reference.
