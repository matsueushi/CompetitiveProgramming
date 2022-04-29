function solve(h, w, a)
    for i1 in 1:h-1
        for i2 in i1+1:h
            for j1 in 1:w-1
                for j2 in j1+1:w
                    a[i1, j1] + a[i2, j2] ≤ a[i2, j1] + a[i1, j2] || return false
                end
            end
        end
    end
    true
end

function main()
    h, w = parse.(Int, split(readline()))
    a = zeros(Int, h, w)
    for i in 1:h
        a[i, :] = parse.(Int, split(readline()))
    end
    println(solve(h, w, a) ? "Yes" : "No")
end

main()
