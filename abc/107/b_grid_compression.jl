function solve(h, w, a)
    hasblack_h = falses(h)
    hasblack_w = falses(w)
    for i in 1:h
        for j in 1:w
            isblack = a[i][j] == '#'
            hasblack_h[i] |= isblack
            hasblack_w[j] |= isblack
        end
    end

    for i in 1:h
        hasblack_h[i] || continue
        for j in 1:w
            hasblack_w[j] || continue
            print(a[i][j])
        end
        println()
    end
end

function main()
    h, w = parse.(Int, split(readline()))
    a = Vector{String}(undef, h)
    for i in 1:h
        a[i] = readline()
    end

    solve(h, w, a)
end

main()
