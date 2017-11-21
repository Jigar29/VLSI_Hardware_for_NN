library verilog;
use verilog.vl_types.all;
entity mult is
    generic(
        start           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        s0              : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        s1              : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        s2              : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        s3              : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        s4              : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        s5              : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        s6              : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1);
        s7              : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        s8              : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi1);
        s9              : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi0);
        s10             : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi1);
        s11             : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi0, Hi0);
        s12             : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi0, Hi1);
        s14             : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi1, Hi0);
        stop            : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi1, Hi1);
        BIT_WIDTH       : integer := 4
    );
    port(
        result          : out    vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        multiplicand    : in     vl_logic_vector(3 downto 0);
        multiplier      : in     vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of start : constant is 1;
    attribute mti_svvh_generic_type of s0 : constant is 1;
    attribute mti_svvh_generic_type of s1 : constant is 1;
    attribute mti_svvh_generic_type of s2 : constant is 1;
    attribute mti_svvh_generic_type of s3 : constant is 1;
    attribute mti_svvh_generic_type of s4 : constant is 1;
    attribute mti_svvh_generic_type of s5 : constant is 1;
    attribute mti_svvh_generic_type of s6 : constant is 1;
    attribute mti_svvh_generic_type of s7 : constant is 1;
    attribute mti_svvh_generic_type of s8 : constant is 1;
    attribute mti_svvh_generic_type of s9 : constant is 1;
    attribute mti_svvh_generic_type of s10 : constant is 1;
    attribute mti_svvh_generic_type of s11 : constant is 1;
    attribute mti_svvh_generic_type of s12 : constant is 1;
    attribute mti_svvh_generic_type of s14 : constant is 1;
    attribute mti_svvh_generic_type of stop : constant is 1;
    attribute mti_svvh_generic_type of BIT_WIDTH : constant is 1;
end mult;
