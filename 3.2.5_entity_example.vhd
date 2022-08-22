entity test is
    port(
        in1, in2 : in bit;
        out1 : out bit;
    );
    generic(
        gain: integer := 4;
        time_delay: time := 10 ns;
);
constant: rpullup : real := 1000.0;
ent entty test;
    