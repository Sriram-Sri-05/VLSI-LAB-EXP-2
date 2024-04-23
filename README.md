# SIMULATION AND IMPLEMENTATION OF COMBINATIONAL LOGIC CIRCUITS

AIM: To simulate and synthesis Logic Gates,Adders and Subtractor using Vivado Software

APPARATUS REQUIRED : Vivado™ ML 2023.2

PROCEDURE :

Open Vivado: Launch Xilinx Vivado software on your computer.

Create a New Project: Click on "Create Project" from the welcome page or navigate through "File" > "Project" > "New".

Project Settings: Follow the prompts to set up your project. Specify the project name, location, and select RTL project type.

Add Design Files: Add your Verilog design files to the project. You can do this by right-clicking on "Design Sources" in the Sources window, then selecting "Add Sources". Choose your Verilog files from the file browser.

Specify Simulation Settings: Go to "Simulation" > "Simulation Settings". Choose your simulation language (Verilog in this case) and simulation tool (Vivado Simulator).

Run Simulation: Go to "Flow" > "Run Simulation" > "Run Behavioral Simulation". This will launch the Vivado Simulator and compile your design for simulation.

Set Simulation Time: In the Vivado Simulator window, set the simulation time if it's not set automatically. This determines how long the simulation will run.

Run Simulation: Start the simulation by clicking on the "Run" button in the simulation window.

View Results: After the simulation completes, you can view waveforms, debug signals, and analyze the behavior of your design.
**LOGIC DIAGRAM**

ENCODER

![image](https://github.com/navaneethans/VLSI-LAB-EXP-2/assets/6987778/3cd1f95e-7531-4cad-9154-fdd397ac439e)


DECODER

![image](https://github.com/navaneethans/VLSI-LAB-EXP-2/assets/6987778/45a5e6cf-bbe0-4fd5-ac84-e5ad4477483b)


MULTIPLEXER

![image](https://github.com/navaneethans/VLSI-LAB-EXP-2/assets/6987778/427f75b2-8e67-44b9-ac45-a66651787436)


DEMULTIPLEXER

![image](https://github.com/navaneethans/VLSI-LAB-EXP-2/assets/6987778/1c45a7fc-08ac-4f76-87f2-c084e7150557)


MAGNITUDE COMPARATOR

![image](https://github.com/navaneethans/VLSI-LAB-EXP-2/assets/6987778/b2fe7a05-6bf7-4dcb-8f5d-28abbf7ea8c2)


  
PROCEDURE:
STEP:1  Start  the Xilinx navigator, Select and Name the New project.
STEP:2  Select the device family, device, package and speed.       
STEP:3  Select new source in the New Project and select Verilog Module as the Source type.                       
STEP:4  Type the File Name and Click Next and then finish button. Type the code and save it.
STEP:5  Select the Behavioral Simulation in the Source Window and click the check syntax.                       
STEP:6  Click the simulation to simulate the program and  give the inputs and verify the outputs as per the truth table.               
STEP:7  Select the Implementation in the Sources Window and select the required file in the Processes Window.
STEP:8  Select Check Syntax from the Synthesize  XST Process. Double Click in the  FloorplanArea/IO/Logic-Post Synthesis process in the User Constraints process group. UCF(User constraint File) is obtained. 
STEP:9  In the Design Object List Window, enter the pin location for each pin in the Loc column Select save from the File menu.
STEP:10 Double click on the Implement Design and double click on the Generate Programming File to create a bitstream of the design.(.v) file is converted into .bit file here.
STEP:11  On the board, by giving required input, the LEDs starts to glow light, indicating the output.

VERILOG CODE

   1. Decoder 3to 8:
```
       module decoder_struct(  
  input [2:0] a,    
  output [7:0] d    
   );
wire x,y,z;
not g1(z,a[0]);
not g2(y,a[1]);
not g3(x,a[2]);
and g4(d[0],x,y,z);
and g5(d[1],x,y,a[0]);
and g6(d[2],x,a[1],z);
and g7(d[3],x,a[1],a[0]);
and g8(d[4],a[2],y,z);
and g9(d[5],a[2],y,a[0]);
and g10(d[6],a[2],a[1],z);
and g11(d[7],a[2],a[1],a[0]);
endmodule
```
output:
![image](https://github.com/Gokuls2003/VLSI-LAB-EXP-2/assets/159005418/c52832ba-6d26-431a-bc80-7fcaa83a00a4)

elaborated design:
![image](https://github.com/Gokuls2003/VLSI-LAB-EXP-2/assets/159005418/5c18434d-7018-41ed-8ead-832f61928a99)



2.demultiplwxer1to8:
```
module demux_1_8(y,s,a);
output reg [7:0]y;
input [2:0]s;
input a;

always @(*)
begin 
y=0;
case(s)
3'd0: y[0]=a;
3'd1: y[1]=a;
3'd2: y[2]=a;
3'd3: y[3]=a;
3'd4: y[4]=a;
3'd5: y[5]=a;
3'd6: y[6]=a;
3'd7: y[7]=a;
endcase
end
endmodule
```
output:
![image](https://github.com/Gokuls2003/VLSI-LAB-EXP-2/assets/159005418/5b6f3beb-121f-4b0f-92d4-639d155fc510)
elaborated design:
![image](https://github.com/Gokuls2003/VLSI-LAB-EXP-2/assets/159005418/8e5f8db2-274e-4f65-b5a5-6220b7d410fe)

3.encoder 8to3:
```
module encoder_8_to_3(a0,a1,a2,d0,d1,d2,d3,d4,d5,d6,d7);
input d0,d1,d2,d3,d4,d5,d6,d7;
output a0,a1,a2;
or g1(a0,d1,d3,d5,d7);
or g2(a1,d2,d3,d6,d7);
or g3(a2,d4,d5,d6,d7);
endmodule
```
output:
![image](https://github.com/Gokuls2003/VLSI-LAB-EXP-2/assets/159005418/db5a1c29-cf60-4c5a-8cd9-65677edc805c)
elaborated design:
![image](https://github.com/Gokuls2003/VLSI-LAB-EXP-2/assets/159005418/e89f0116-af76-45cd-af5a-2c47f8231001)

4. Magnitudecomparator:
```
module comparator(a,b,eq,lt,gt);
input [3:0] a,b;
output reg eq,lt,gt;
always @(a,b)
begin
 if (a==b)
 begin
  eq = 1'b1;
  lt = 1'b0;
  gt = 1'b0;
 end
 else if (a>b)
begin
  eq = 1'b0;
  lt = 1'b0;
  gt = 1'b1;
 end
 else
 begin
  eq = 1'b0;
  lt = 1'b1;
  gt = 1'b0;
 end
end 
endmodule
```
output:
![image](https://github.com/Gokuls2003/VLSI-LAB-EXP-2/assets/159005418/8a6430c4-145c-4760-b99a-8660f411dbad)

elaborated design:
![image](https://github.com/Gokuls2003/VLSI-LAB-EXP-2/assets/159005418/2f03e0c7-a251-444a-82df-e5ea5bd64b9d)

5.Multiplexer 8to1:
```
module mux_8tol (in, sel, out);
    input [7:0] in;
    input [2:0] sel;
    output reg out;
    always @(*)
       begin
          case (sel)
              3'b000: out = in [0];
              3'b001: out = in [1];
              3'b010: out = in [2];
              3'b011: out = in [3];
              3'b100: out = in [4];
              3'b101: out = in [5];
              3'b110: out = in [6];
              3'b111: out = in [7];
              default: out = 1'bx;
          endcase
       end
endmodule
```
output:
![image](https://github.com/Gokuls2003/VLSI-LAB-EXP-2/assets/159005418/ac7b19e2-1e84-4365-8c8a-e68f3dbcca77)

elaborated design:
![image](https://github.com/Gokuls2003/VLSI-LAB-EXP-2/assets/159005418/cfe3227e-67da-4bc5-a414-8b7dc734d18a)

Result:
 The Simulation and Synthesis Logic Gates,Adders and Subtractor is successfully verified using Vivado Software .


