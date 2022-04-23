function main()
    s = readline()
    ns = parse.(Int, split(s, "x"))
    println(prod(ns))
end

main()
