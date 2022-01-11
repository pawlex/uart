`timescale 1ns/100ps

module tb();
reg reset_n=0;
reg clk=0;

initial begin
    forever #10 clk = ~clk;
end

initial begin
    reset_n = 0;
    #10;
    reset_n = 1;
    #600 $finish;
end

initial begin
    $dumpfile ("dump.vcd");
    $dumpvars();
end

/* SOME EXAMPLES */
initial begin
    repeat(4) @(posedge clk);
    reset <= 0;
end


integer my_address = 0;
initial begin
    repeat(4) @(posedge clk);
    wait(wait_req == 0)
        repeat(100) @(posedge clk)
            while (my_address < 'h100) @(posedge clk) begin
                @(posedge clk);
            end
        #10000 $finish;
end

top
    dut
    (
        .clk(clk),
        .reset_n(reset_n)
    );

endmodule

