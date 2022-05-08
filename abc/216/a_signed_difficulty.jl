function main()
    x, y = parse.(Int, split(readline(), '.'))
    if y ≤ 2
        println("$(x)-")
    elseif y ≤ 6
        println(x)
    else
        println("$(x)+")
    end
end

main()
