//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Thu Sep 23 18:07:38 2021
//Host        : LAPTOP-VOSD4RFJ running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (CE,
    CLK,
    L,
    LOAD,
    UP,
    Y);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 CE.CE CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CE.CE, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN design_1_CLK_0, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.L DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.L, LAYERED_METADATA undef" *) input [15:0]L;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LOAD DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LOAD, LAYERED_METADATA undef" *) input LOAD;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.UP DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.UP, LAYERED_METADATA undef" *) input UP;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.Y DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.Y, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} DATA_WIDTH 16}" *) output [15:0]Y;

  wire CE_0_1;
  wire CLK_0_1;
  wire LOAD_0_1;
  wire [15:0]L_0_1;
  wire UP_0_1;
  wire [15:0]c_counter_binary_0_Q;

  assign CE_0_1 = CE;
  assign CLK_0_1 = CLK;
  assign LOAD_0_1 = LOAD;
  assign L_0_1 = L[15:0];
  assign UP_0_1 = UP;
  assign Y[15:0] = c_counter_binary_0_Q;
  design_1_c_counter_binary_0_0 c_counter_binary_0
       (.CE(CE_0_1),
        .CLK(CLK_0_1),
        .L(L_0_1),
        .LOAD(LOAD_0_1),
        .Q(c_counter_binary_0_Q),
        .UP(UP_0_1));
endmodule
