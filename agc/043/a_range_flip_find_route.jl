parseints() = parse.(Int, split(readline()))

const dx = [1, 0]
const dy = [0, 1]

function solve(h, w, ss)
    zs = fill(typemax(Int), h, w)
    zs[1, 1] = ifelse(ss[1][1] == '.', 0, 1)
    for i in 1:h
        for j in 1:w
            for k in 1:2
                i0 = i + dx[k]
                j0 = j + dy[k]
                (1 ≤ i0 ≤ h && 1 ≤ j0 ≤ w) || continue
                if ss[i0][j0] == '.'
                    zs[i0, j0] = min(zs[i0, j0], zs[i, j])
                else
                    d = ifelse(ss[i][j] == '#', 0, 1)
                    zs[i0, j0] = min(zs[i0, j0], zs[i, j] + d)
                end
            end
        end
    end
    zs[h, w]
end

function main()
    h, w = parseints()
    ss = Vector{String}(undef, h)
    for i in 1:h
        ss[i] = readline()
    end
    println(solve(h, w, ss))
end

main()
