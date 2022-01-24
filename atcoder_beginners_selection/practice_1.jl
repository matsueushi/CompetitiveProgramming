using Printf

function main()
    lines = readlines()
    a = parse(Int64, lines[1])
    b, c = parse.(Int64, split(lines[2]))
    s = lines[3]
    @printf "%d %s\n" a + b + c s
end

main()