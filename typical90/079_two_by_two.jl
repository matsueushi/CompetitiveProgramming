function solve(h, w, amat, bmat)
    dx = [0, 0, 1, 1]
    dy = [0, 1, 0, 1]
    zs = bmat .- amat
    res = 0
    for i in 1:h-1
        for j in 1:w-1
            x = zs[i, j]
            res += abs(x)
            for k in 1:4
                zs[i+dx[k], j+dy[k]] -= x
            end
        end
    end
    zs, res
end

function main()
    h, w = parse.(Int64, split(readline()))
    amat = zeros(Int64, h, w)
    bmat = zero(amat)
    for i in 1:h
        amat[i, :] = parse.(Int64, split(readline()))
    end
    for i in 1:h
        bmat[i, :] = parse.(Int64, split(readline()))
    end
    zs, res = solve(h, w, amat, bmat)
    if iszero(zs)
        println("Yes")
        println(res)
    else
        println("No")
    end
end

main()
