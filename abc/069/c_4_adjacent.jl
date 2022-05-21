parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function main()
    n = parseint()
    as = parseints()
    m0 = 0
    m1 = 0
    m2 = 0
    for i in 1:n
        a = as[i]
        if isodd(a)
            m0 += 1
        elseif a % 4 == 0
            m2 += 1
        else
            m1 += 1
        end
    end
    println(ifelse(m0 ≤ m2 || (m1 == 0 && m0 == m2 + 1), "Yes", "No"))
end

main()
