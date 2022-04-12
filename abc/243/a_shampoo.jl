function main()
    v, a, b, c = parse.(Int64, split(readline()))
    abc = a + b + c
    v %= abc
    if v < a
        println("F")
    elseif v < a + b
        println("M")
    else
        println("T")
    end
end

main()
