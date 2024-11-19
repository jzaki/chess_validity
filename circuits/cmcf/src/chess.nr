pub mod pieces;

use pieces::{Piece, Board};

pub struct Position {
    pub x: Field,
    pub y: Field,
}

pub struct Move {
    pub start: Position,
    pub end: Position
}

pub fn is_valid_move(board: Board, move: Move) {
    let piece: Piece = board[move.start.y][move.start.x];

    if piece.black == true {
        // unconstrained inversion
        // constrained verification?
    }

    // white moves
    if piece.piece_type == 0 {
        assert(false, "No piece");
    } else if piece.piece_type == 1 {
        is_valid_pawn_move(board, move);
    } else if piece.piece_type == 2 {
        is_valid_knight_move(board, move);
    } else {
        assert(false, "Other pieces not implemented");
    }
}

global MAX_FIELD_VALUE: Field =
    21888242871839275222246405745257275088548364400416034343698204186575808495616;

// 
// o
// |
// o X
// |/
// P x
// 
pub fn is_valid_pawn_move(board: Board, move: Move) {
    if move.start.x == move.end.x { // moving forward uncollided

        // nothing one square ahead
        let piece_one_ahead = board[move.start.y+1][move.start.x];
        assert(piece_one_ahead.piece_type == 0);

        let step = move.end.y - move.start.y;

        if step == 2 { // step forward 2 squares
            assert(move.start.y == 1, "Double step from first row only"); // from first row only
            // nothing two squares ahead
            let piece_two_ahead = board[move.end.y][move.start.x];
            assert(piece_two_ahead.piece_type == 0, "Path obstructed");
        } else if step != 1 { // backward or non-step
            assert(false, "Should step by 1");
        }
    } else { // capture (diagonal move, capture or en passant)
        assert(move.end.y - move.start.y == 1); // one step forward
        let step_right = move.end.x - move.start.x;

        // left or right by 1
        assert((step_right == 1) | (step_right == MAX_FIELD_VALUE));

        let capture_piece = board[move.end.y][move.end.x];
        if capture_piece.black == true { // capture diagonal
            // successful capture
        } else if capture_piece.piece_type == 0 { // possibly en passant
            let ep_piece = board[move.start.y][move.end.x];
            assert(Piece::Eq(ep_piece,Piece::pawn(true))); // captured pawn
        }
    }

    if move.end.y == 7 { // promotion
        //todo
    }
    
}

// 
//    x   x
//     \ /
//x-.-. | .-.-x
//     \|/
//      K
//     /|\
//x-.-. | .-.-x
//     / \
//    x   x
// 
pub fn is_valid_knight_move(board: Board, move: Move) {
    println("is_valid_knight_move");
    assert(false, "Not implemented");
}
