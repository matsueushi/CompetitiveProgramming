parseints() = parse.(Int, split(readline()))

function main()
    s, t = parseints()
    res = 0
    for i in 0:100
        for j in 0:100
            for k in 0:100
                (i + j + k ≤ s && i * j * k ≤ t) && (res += 1)
            end
        end
    end
    println(res)
end

main()
