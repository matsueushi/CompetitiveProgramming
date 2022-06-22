parseint() = parse(Int, readline())

function main()
    n = parseint()
    if n ≤ 125
        println(4)
    elseif n ≤ 211
        println(6)
    else
        println(8)
    end
end

main()
