function reversed_number(n)
    rev = 0
    while n > 0
        rev *= 10
        n, r = divrem(n, 10)
        rev += r
    end
    rev
end

function main()
    a, b = parse.(Int, split(readline()))
    res = 0
    for i in a:b
        i == reversed_number(i) && (res += 1)
    end
    println(res)
end

main()
