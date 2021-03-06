# +----------------------------------------------------------------------------+
# | License Agreement                                                          |
# |                                                                            |
# | Copyright (c) 1991-2013 Altera Corporation, San Jose, California, USA.     |
# | All rights reserved.                                                       |
# |                                                                            |
# | Any megafunction design, and related net list (encrypted or decrypted),    |
# |  support information, device programming or simulation file, and any other |
# |  associated documentation or information provided by Altera or a partner   |
# |  under Altera's Megafunction Partnership Program may be used only to       |
# |  program PLD devices (but not masked PLD devices) from Altera.  Any other  |
# |  use of such megafunction design, net list, support information, device    |
# |  programming or simulation file, or any other related documentation or     |
# |  information is prohibited for any other purpose, including, but not       |
# |  limited to modification, reverse engineering, de-compiling, or use with   |
# |  any other silicon devices, unless such use is explicitly licensed under   |
# |  a separate agreement with Altera or a megafunction partner.  Title to     |
# |  the intellectual property, including patents, copyrights, trademarks,     |
# |  trade secrets, or maskworks, embodied in any such megafunction design,    |
# |  net list, support information, device programming or simulation file, or  |
# |  any other related documentation or information provided by Altera or a    |
# |  megafunction partner, remains with Altera, the megafunction partner, or   |
# |  their respective licensors.  No other licenses, including any licenses    |
# |  needed under any third party's intellectual property, are provided herein.|
# |  Copying or modifying any file, or portion thereof, to which this notice   |
# |  is attached violates this copyright.                                      |
# |                                                                            |
# | THIS FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    |
# | IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   |
# | FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL    |
# | THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER |
# | LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING    |
# | FROM, OUT OF OR IN CONNECTION WITH THIS FILE OR THE USE OR OTHER DEALINGS  |
# | IN THIS FILE.                                                              |
# |                                                                            |
# | This agreement shall be governed in all respects by the laws of the State  |
# |  of California and by the laws of the United States of America.            |
# |                                                                            |
# +----------------------------------------------------------------------------+

# TCL File Generated by Altera University Program
# DO NOT MODIFY

# +-----------------------------------
# | module altera_up_avalon_ethernet
# | 
set_module_property DESCRIPTION "Ethernet Controller for the DE-Series Boards"
set_module_property NAME altera_up_avalon_ethernet
set_module_property VERSION 13.0
set_module_property GROUP "University Program/Communications"
set_module_property AUTHOR "Altera University Program"
set_module_property DISPLAY_NAME Ethernet
set_module_property DATASHEET_URL doc/Altera_UP_Avalon_Ethernet.pdf
#set_module_property TOP_LEVEL_HDL_FILE altera_up_avalon_ethernet.v
#set_module_property TOP_LEVEL_HDL_MODULE altera_up_avalon_ethernet
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE false
set_module_property GENERATION_CALLBACK generate
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
#add_file altera_up_avalon_ethernet.v {SYNTHESIS SIMULATION}
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point clock_reset
# | 
add_interface clock_reset clock end
set_interface_property clock_reset ptfSchematicName ""

add_interface_port clock_reset clk clk Input 1
add_interface_port clock_reset reset reset Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point avalon_ethernet_slave
# | 
add_interface avalon_ethernet_slave avalon end clock_reset
set_interface_property avalon_ethernet_slave addressAlignment NATIVE
set_interface_property avalon_ethernet_slave bridgesToMaster ""
set_interface_property avalon_ethernet_slave burstOnBurstBoundariesOnly false
#set_interface_property avalon_ethernet_slave explicitAddressSpan 2
set_interface_property avalon_ethernet_slave holdTime 20
set_interface_property avalon_ethernet_slave isBigEndian  false
set_interface_property avalon_ethernet_slave isFlash false
set_interface_property avalon_ethernet_slave isMemoryDevice false
set_interface_property avalon_ethernet_slave isNonVolatileStorage false
set_interface_property avalon_ethernet_slave linewrapBursts false
set_interface_property avalon_ethernet_slave maximumPendingReadTransactions 0
set_interface_property avalon_ethernet_slave minimumUninterruptedRunLength 1
set_interface_property avalon_ethernet_slave printableDevice false
set_interface_property avalon_ethernet_slave readLatency 2
set_interface_property avalon_ethernet_slave readWaitTime 40
set_interface_property avalon_ethernet_slave setupTime 0
set_interface_property avalon_ethernet_slave timingUnits nanoseconds
set_interface_property avalon_ethernet_slave writeWaitTime 40

set_interface_property avalon_ethernet_slave writeWaitStates 40
set_interface_property avalon_ethernet_slave readWaitStates 40

add_interface_port avalon_ethernet_slave address address Input 1
add_interface_port avalon_ethernet_slave chipselect chipselect Input 1
add_interface_port avalon_ethernet_slave read read Input 1
add_interface_port avalon_ethernet_slave write write Input 1
add_interface_port avalon_ethernet_slave writedata writedata Input 16
add_interface_port avalon_ethernet_slave readdata readdata Output 16
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point external_interface
# | 
add_interface external_interface conduit end 

add_interface_port external_interface ENET_INT export Input 1
add_interface_port external_interface ENET_DATA export Bidir 16
add_interface_port external_interface ENET_RST_N export Output 1
add_interface_port external_interface ENET_CS_N export Output 1
add_interface_port external_interface ENET_CMD export Output 1
add_interface_port external_interface ENET_RD_N export Output 1
add_interface_port external_interface ENET_WR_N export Output 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point interrupt
# | 
add_interface interrupt interrupt end clock_reset
set_interface_property interrupt associatedAddressablePoint avalon_ethernet_slave

add_interface_port interrupt irq irq Output 1
# | 
# +-----------------------------------

# +-----------------------------------
# | Generation function
# | 
proc generate {} {
	send_message info "Starting Generation of Ethernet"

	# get parameter values

	# set section values

	# set arguments
	set params ""
	set sections ""

	# get generation settings
#	set dest_language	[ get_generation_property HDL_LANGUAGE ]
	set dest_dir 		[ get_generation_property OUTPUT_DIRECTORY ]
	set dest_name		[ get_generation_property OUTPUT_NAME ]
	add_file "$dest_dir$dest_name.v" {SYNTHESIS SIMULATION}

	# Generate HDL
	source "up_ip_generator.tcl"
	alt_up_generate "$dest_dir$dest_name.v" "hdl/altera_up_avalon_ethernet.v" $dest_name $params $sections
}
# | 
# +-----------------------------------

