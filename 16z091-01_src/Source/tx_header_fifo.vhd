-- megafunction wizard: %FIFO%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: dcfifo_mixed_widths 

-- ============================================================
-- File Name: tx_header_fifo.vhd
-- Megafunction Name(s):
--          dcfifo_mixed_widths
--
-- Simulation Library Files(s):
--          altera_mf
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 14.0.2 Build 209 09/17/2014 SJ Full Version
-- ************************************************************


--Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, the Altera Quartus II License Agreement,
--the Altera MegaCore Function License Agreement, or other 
--applicable license agreement, including, without limitation, 
--that your use is for the sole purpose of programming logic 
--devices manufactured by Altera and sold by Altera or its 
--authorized distributors.  Please refer to the applicable 
--agreement for further details.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY tx_header_fifo IS
   generic(
      DEVICE_FAMILY        : string  := "Cyclone IV GX";
      TX_HEADER_FIFO_DEPTH : natural := 32;
      TX_HEADER_LPM_WIDTHU : natural := 5
   );
   PORT(
      aclr    : IN  STD_LOGIC := '0';
      data    : IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
      rdclk   : IN  STD_LOGIC ;
      rdreq   : IN  STD_LOGIC ;
      wrclk   : IN  STD_LOGIC ;
      wrreq   : IN  STD_LOGIC ;
      q       : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      rdempty : OUT STD_LOGIC ;
      wrfull  : OUT STD_LOGIC ;
      wrusedw : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
   );
END tx_header_fifo;


ARCHITECTURE SYN OF tx_header_fifo IS

   SIGNAL sub_wire0  : STD_LOGIC_VECTOR (63 DOWNTO 0);
   SIGNAL sub_wire1  : STD_LOGIC ;
   SIGNAL sub_wire2  : STD_LOGIC ;
   SIGNAL sub_wire3  : STD_LOGIC_VECTOR (4 DOWNTO 0);



   COMPONENT dcfifo_mixed_widths
   GENERIC (
      intended_device_family : STRING;
      lpm_numwords           : NATURAL;
      lpm_showahead          : STRING;
      lpm_type               : STRING;
      lpm_width              : NATURAL;
      lpm_widthu             : NATURAL;
      lpm_widthu_r           : NATURAL;
      lpm_width_r            : NATURAL;
      overflow_checking      : STRING;
      rdsync_delaypipe       : NATURAL;
      read_aclr_synch        : STRING;
      underflow_checking     : STRING;
      use_eab                : STRING;
      write_aclr_synch       : STRING;
      wrsync_delaypipe       : NATURAL
   );
   PORT (
      aclr    : IN STD_LOGIC ;
      data    : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      rdclk   : IN STD_LOGIC ;
      rdreq   : IN STD_LOGIC ;
      wrclk   : IN STD_LOGIC ;
      wrreq   : IN STD_LOGIC ;
      q       : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      rdempty : OUT STD_LOGIC ;
      wrfull  : OUT STD_LOGIC ;
      wrusedw : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
   );
   END COMPONENT;

BEGIN
   q       <= sub_wire0(63 DOWNTO 0);
   rdempty <= sub_wire1;
   wrfull  <= sub_wire2;
   wrusedw <= sub_wire3(4 DOWNTO 0);

   dcfifo_mixed_widths_component : dcfifo_mixed_widths
   GENERIC MAP (
-- original settings configured with MegaWizard
      --intended_device_family => "Cyclone IV GX",
      --lpm_numwords => 32,
      --lpm_widthu => 5,
      --lpm_widthu_r => 4,

      intended_device_family => DEVICE_FAMILY,
      lpm_numwords           => TX_HEADER_FIFO_DEPTH,  -- value assigned must comply with this equation
                                                       -- 2^(LPM_WIDTHU -1) < LPM_NUMWORDS <= 2^(LPM_WIDTHU)
      lpm_showahead      => "OFF",                     -- off: normal mode, on: show ahead mode
      lpm_type           => "dcfifo_mixed_widths",     -- DON'T CHANGE / FIFO type
      lpm_width          => 32,                        -- DON'T CHANGE / width for data_in port (data)
      lpm_widthu         => TX_HEADER_LPM_WIDTHU,      -- size of write usedw
      lpm_widthu_r       => TX_HEADER_LPM_WIDTHU -1,   -- size of read usedw
      lpm_width_r        => 64,                        -- DON'T CHANGE / width for data_out port (q)
      overflow_checking  => "ON",                      -- DON'T CHANGE / protection circuit for overflow checking
      rdsync_delaypipe   => 4,                         -- nbr of read synchronization stages, internally reduced by 2 => 2 stages
      read_aclr_synch    => "OFF",
      underflow_checking => "ON",                      -- DON'T CHANGE / protection circuit for underflow checking
      use_eab            => "ON",                      -- off: FIFO implemented in logic, on: FIFO implemented using RAM blocks
      write_aclr_synch   => "OFF",
      wrsync_delaypipe   => 4                          -- nbr of write synchronization stages, internally reduced by 2 => 2 stages
   )
   PORT MAP (
      aclr    => aclr,
      data    => data,
      rdclk   => rdclk,
      rdreq   => rdreq,
      wrclk   => wrclk,
      wrreq   => wrreq,
      q       => sub_wire0,
      rdempty => sub_wire1,
      wrfull  => sub_wire2,
      wrusedw => sub_wire3
   );



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: AlmostEmpty NUMERIC "0"
-- Retrieval info: PRIVATE: AlmostEmptyThr NUMERIC "-1"
-- Retrieval info: PRIVATE: AlmostFull NUMERIC "0"
-- Retrieval info: PRIVATE: AlmostFullThr NUMERIC "-1"
-- Retrieval info: PRIVATE: CLOCKS_ARE_SYNCHRONIZED NUMERIC "0"
-- Retrieval info: PRIVATE: Clock NUMERIC "4"
-- Retrieval info: PRIVATE: Depth NUMERIC "32"
-- Retrieval info: PRIVATE: Empty NUMERIC "1"
-- Retrieval info: PRIVATE: Full NUMERIC "1"
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone IV GX"
-- Retrieval info: PRIVATE: LE_BasedFIFO NUMERIC "0"
-- Retrieval info: PRIVATE: LegacyRREQ NUMERIC "1"
-- Retrieval info: PRIVATE: MAX_DEPTH_BY_9 NUMERIC "0"
-- Retrieval info: PRIVATE: OVERFLOW_CHECKING NUMERIC "0"
-- Retrieval info: PRIVATE: Optimize NUMERIC "0"
-- Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "0"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: UNDERFLOW_CHECKING NUMERIC "0"
-- Retrieval info: PRIVATE: UsedW NUMERIC "1"
-- Retrieval info: PRIVATE: Width NUMERIC "32"
-- Retrieval info: PRIVATE: dc_aclr NUMERIC "1"
-- Retrieval info: PRIVATE: diff_widths NUMERIC "1"
-- Retrieval info: PRIVATE: msb_usedw NUMERIC "0"
-- Retrieval info: PRIVATE: output_width NUMERIC "64"
-- Retrieval info: PRIVATE: rsEmpty NUMERIC "1"
-- Retrieval info: PRIVATE: rsFull NUMERIC "0"
-- Retrieval info: PRIVATE: rsUsedW NUMERIC "0"
-- Retrieval info: PRIVATE: sc_aclr NUMERIC "0"
-- Retrieval info: PRIVATE: sc_sclr NUMERIC "0"
-- Retrieval info: PRIVATE: wsEmpty NUMERIC "0"
-- Retrieval info: PRIVATE: wsFull NUMERIC "1"
-- Retrieval info: PRIVATE: wsUsedW NUMERIC "1"
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone IV GX"
-- Retrieval info: CONSTANT: LPM_NUMWORDS NUMERIC "32"
-- Retrieval info: CONSTANT: LPM_SHOWAHEAD STRING "OFF"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "dcfifo_mixed_widths"
-- Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "32"
-- Retrieval info: CONSTANT: LPM_WIDTHU NUMERIC "5"
-- Retrieval info: CONSTANT: LPM_WIDTHU_R NUMERIC "4"
-- Retrieval info: CONSTANT: LPM_WIDTH_R NUMERIC "64"
-- Retrieval info: CONSTANT: OVERFLOW_CHECKING STRING "ON"
-- Retrieval info: CONSTANT: RDSYNC_DELAYPIPE NUMERIC "4"
-- Retrieval info: CONSTANT: READ_ACLR_SYNCH STRING "OFF"
-- Retrieval info: CONSTANT: UNDERFLOW_CHECKING STRING "ON"
-- Retrieval info: CONSTANT: USE_EAB STRING "ON"
-- Retrieval info: CONSTANT: WRITE_ACLR_SYNCH STRING "OFF"
-- Retrieval info: CONSTANT: WRSYNC_DELAYPIPE NUMERIC "4"
-- Retrieval info: USED_PORT: aclr 0 0 0 0 INPUT GND "aclr"
-- Retrieval info: USED_PORT: data 0 0 32 0 INPUT NODEFVAL "data[31..0]"
-- Retrieval info: USED_PORT: q 0 0 64 0 OUTPUT NODEFVAL "q[63..0]"
-- Retrieval info: USED_PORT: rdclk 0 0 0 0 INPUT NODEFVAL "rdclk"
-- Retrieval info: USED_PORT: rdempty 0 0 0 0 OUTPUT NODEFVAL "rdempty"
-- Retrieval info: USED_PORT: rdreq 0 0 0 0 INPUT NODEFVAL "rdreq"
-- Retrieval info: USED_PORT: wrclk 0 0 0 0 INPUT NODEFVAL "wrclk"
-- Retrieval info: USED_PORT: wrfull 0 0 0 0 OUTPUT NODEFVAL "wrfull"
-- Retrieval info: USED_PORT: wrreq 0 0 0 0 INPUT NODEFVAL "wrreq"
-- Retrieval info: USED_PORT: wrusedw 0 0 5 0 OUTPUT NODEFVAL "wrusedw[4..0]"
-- Retrieval info: CONNECT: @aclr 0 0 0 0 aclr 0 0 0 0
-- Retrieval info: CONNECT: @data 0 0 32 0 data 0 0 32 0
-- Retrieval info: CONNECT: @rdclk 0 0 0 0 rdclk 0 0 0 0
-- Retrieval info: CONNECT: @rdreq 0 0 0 0 rdreq 0 0 0 0
-- Retrieval info: CONNECT: @wrclk 0 0 0 0 wrclk 0 0 0 0
-- Retrieval info: CONNECT: @wrreq 0 0 0 0 wrreq 0 0 0 0
-- Retrieval info: CONNECT: q 0 0 64 0 @q 0 0 64 0
-- Retrieval info: CONNECT: rdempty 0 0 0 0 @rdempty 0 0 0 0
-- Retrieval info: CONNECT: wrfull 0 0 0 0 @wrfull 0 0 0 0
-- Retrieval info: CONNECT: wrusedw 0 0 5 0 @wrusedw 0 0 5 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL tx_header_fifo.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL tx_header_fifo.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL tx_header_fifo.cmp FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL tx_header_fifo.bsf FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL tx_header_fifo_inst.vhd FALSE
-- Retrieval info: LIB_FILE: altera_mf
