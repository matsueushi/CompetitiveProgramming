parseints() = parse.(Int, split(readline()))

function solve(h, w, a)
    res = NTuple{4,Int}[]
    for i in 1:h
        for j in 1:w
            iseven(a[i, j]) && continue
            if i != h
                push!(res, (i, j, i + 1, j))
                a[i+1, j] += 1
            elseif j != w
                push!(res, (i, j, i, j + 1))
                a[i, j+1] += 1
            end
        end
    end
    res
end

function main()
    h, w = parseints()
    a = zeros(Int, h, w)
    for i in 1:h
        a[i, :] = parseints()
    end
    res = solve(h, w, a)
    println(length(res))
    for (x1, y1, x2, y2) in res
        println("$x1 $y1 $x2 $y2")
    end
end

main()
