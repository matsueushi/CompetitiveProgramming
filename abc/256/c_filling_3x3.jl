parseints() = parse.(Int, split(readline()))

function solve(hws)
    h1 = hws[1]
    h2 = hws[2]
    res = 0
    for i11 in 1:h1
        for i12 in 1:h1
            i13 = h1 - i11 - i12
            i13 ≥ 1 || continue
            for i21 in 1:h2
                i31 = hws[4] - i11 - i21
                i31 ≥ 1 || continue
                for i22 in 1:h2
                    i23 = h2 - i21 - i22
                    i23 ≥ 1 || continue
                    i32 = hws[5] - i12 - i22
                    i32 ≥ 1 || continue
                    hws[6] - i13 - i23 == hws[3] - i31 - i32 || continue
                    hws[6] - i13 - i23 ≥ 1 || continue
                    res += 1
                end
            end
        end
    end
    res
end

function main()
    hws = parseints()
    solve(hws) |> println
end

main()
