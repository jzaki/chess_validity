
pub type Board = [[Piece; 8]; 8];

// Board when viewing from white:
// (8,A ... 8,H)      (0,7 ... 7,7)
// (    ...    )  ==  (    ...    )
// (1,A ... 1,H)      (0,0 ... 0,7)

pub fn start_board() -> Board {
    [ // 0,0 ... 7,0 (white rank 1)
    [Piece::rook(false), Piece::knight(false), Piece::bishop(false), Piece::queen(false), Piece::king(false), Piece::bishop(false), Piece::knight(false), Piece::rook(false)],
    [Piece::pawn(false); 8],
    [Piece::none(false); 8],
    [Piece::none(false); 8],
    [Piece::none(false); 8],
    [Piece::none(false); 8],
    [Piece::pawn(true); 8],
    [Piece::rook(true), Piece::knight(true), Piece::bishop(true), Piece::queen(true), Piece::king(true), Piece::bishop(true), Piece::knight(true), Piece::rook(true)],
    ] // 0,7 ... 7,7 (black rank 8)
}

pub struct Piece {
    pub piece_type: Field,
    pub black: bool,
}

impl Default for Piece {
    fn default() -> Piece {
        Piece::none(false)
    }
}

pub impl Piece {
    pub fn Eq(self: Self, other: Piece) -> bool {
        (self.piece_type == other.piece_type) & (self.black == other.black)
    }
}

pub impl Piece {
    pub fn none(black: bool) -> Piece {
        Piece { piece_type: 0,
        black }
    }
    pub fn pawn(black: bool) -> Piece {
        Piece { piece_type: 1,
        black }
    }
    pub fn knight(black: bool) -> Piece {
        Piece { piece_type: 2,
        black }
    }
    pub fn bishop(black: bool) -> Piece {
        Piece { piece_type: 3,
        black }
    }
    pub fn rook(black: bool) -> Piece {
        Piece { piece_type: 4,
        black }
    }
    pub fn queen(black: bool) -> Piece {
        Piece { piece_type: 5,
        black }
    }
    pub fn king(black: bool) -> Piece {
        Piece { piece_type: 6,
        black }
    }
}
