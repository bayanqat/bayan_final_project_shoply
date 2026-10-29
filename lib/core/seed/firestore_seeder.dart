import 'package:cloud_firestore/cloud_firestore.dart';

/// Creates the Shoply Firestore collections with sample data.
/// Uses fixed document ids, so running it again overwrites instead of duplicating.
/// Run once in debug, then remove the call from main.dart.
///
/// Collections:
///   users/{uid}                      profile (password lives in Firebase Auth, never here)
///   users/{uid}/favorites/{productId}
///   users/{uid}/cart/{productId}
///   categories/{categoryId}
///   products/{productId}
///   orders/{orderId}                 status: pending | approved | delivered
///   contact_messages/{messageId}     sent from the Contact Us screen
///   app_content/{about | privacy_policy | terms_conditions | contact}
class FirestoreSeeder {
  static final _firestore = FirebaseFirestore.instance;

  static const String sampleUserId = 'sample_user_mohammad';

  static Future<void> seed() async {
    final batch = _firestore.batch();

    _seedUser(batch);
    _seedCategories(batch);
    _seedProducts(batch);
    _seedFavoritesAndCart(batch);
    _seedOrders(batch);
    _seedContactMessages(batch);
    _seedAppContent(batch);

    await batch.commit();
  }

  static void _seedUser(WriteBatch batch) {
    batch.set(_firestore.collection('users').doc(sampleUserId), {
      'uid': sampleUserId,
      'fullName': 'Mohammad',
      'username': 'mohammad',
      'email': 'mohammad@example.com',
      'address': 'Amman, Jordan',
      'profileImage': '',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  /// Unsplash photo id -> image URL sized for the app
  static String _image(String photoId) {
    return 'https://images.unsplash.com/photo-$photoId?w=600&q=80&fit=crop';
  }

  static final List<Map<String, dynamic>> _categories = [
    {'id': 'shoes', 'name': 'Shoes', 'image': _image('1542291026-7eec264c27ff')},
    {'id': 'clothes', 'name': 'Clothes', 'image': _image('1521572163474-6864f9cf17ab')},
    {'id': 'bags', 'name': 'Bags', 'image': _image('1553062407-98eeb64c6a62')},
    {'id': 'watches', 'name': 'Watches', 'image': _image('1523275335684-37898b6baf30')},
    {'id': 'beauty', 'name': 'Beauty', 'image': _image('1596462502278-27bfdc403348')},
    {'id': 'electronics', 'name': 'Electronics', 'image': _image('1505740420928-5e560c06d30e')},
  ];

  static void _seedCategories(WriteBatch batch) {
    for (final category in _categories) {
      batch.set(_firestore.collection('categories').doc(category['id']), {
        ...category,
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }

  static final List<Map<String, dynamic>> _products = [
    {
      'id': 'nike_air_max',
      'name': 'Nike Air Max',
      'description': 'Lightweight running shoes with Air cushioning.',
      'price': 120.0,
      'categoryId': 'shoes',
      'image': _image('1606107557195-0e29a4b5b4aa'),
      'rating': 4.5,
      'reviewsCount': 120,
    },
    {
      'id': 'leather_bag',
      'name': 'Leather Bag',
      'description': 'Black quilted leather bag with a gold chain strap.',
      'price': 85.0,
      'categoryId': 'bags',
      'image': _image('1548036328-c9fa89d128fa'),
      'rating': 4.7,
      'reviewsCount': 86,
    },
    {
      'id': 'watch',
      'name': 'Watch',
      'description': 'Classic watch with a brown leather strap.',
      'price': 150.0,
      'categoryId': 'watches',
      'image': _image('1524805444758-089113d48a6d'),
      'rating': 4.6,
      'reviewsCount': 64,
    },
    {
      // id kept as adidas_run so favorites and carts that already use it still work
      'id': 'adidas_run',
      'name': 'New Balance 247',
      'description': 'Comfortable olive running shoes for everyday wear.',
      'price': 90.0,
      'categoryId': 'shoes',
      'image': _image('1539185441755-769473a23570'),
      'rating': 4.3,
      'reviewsCount': 95,
    },
    {
      'id': 'white_tshirt',
      'name': 'White T-Shirt',
      'description': 'Soft cotton t-shirt with a regular fit.',
      'price': 25.0,
      'categoryId': 'clothes',
      'image': _image('1521572163474-6864f9cf17ab'),
      'rating': 4.4,
      'reviewsCount': 210,
    },
    {
      'id': 'makeup_set',
      'name': 'Makeup Set',
      'description': 'Brushes, lipstick, mascara and a compact powder in one set.',
      'price': 45.0,
      'categoryId': 'beauty',
      'image': _image('1596462502278-27bfdc403348'),
      'rating': 4.2,
      'reviewsCount': 58,
    },
    {
      'id': 'headphones',
      'name': 'Wireless Headphones',
      'description': 'Over-ear headphones with soft cushions and long battery life.',
      'price': 110.0,
      'categoryId': 'electronics',
      'image': _image('1505740420928-5e560c06d30e'),
      'rating': 4.8,
      'reviewsCount': 143,
    },
  ];

  static void _seedProducts(WriteBatch batch) {
    for (final product in _products) {
      batch.set(_firestore.collection('products').doc(product['id']), {
        ...product,
        'isAvailable': true,
        'stock': 20,
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }

  static void _seedFavoritesAndCart(WriteBatch batch) {
    final userRef = _firestore.collection('users').doc(sampleUserId);
    for (final product in _products) {
      batch.set(userRef.collection('favorites').doc(product['id']), {
        'productId': product['id'],
        'addedAt': FieldValue.serverTimestamp(),
      });
    }
    batch.set(userRef.collection('cart').doc('nike_air_max'), {
      'productId': 'nike_air_max',
      'quantity': 1,
      'addedAt': FieldValue.serverTimestamp(),
    });
  }

  static void _seedOrders(WriteBatch batch) {
    final orders = [
      (1024, 'approved', DateTime(2026, 10, 15), _products[0]),
      (1023, 'pending', DateTime(2026, 10, 12), _products[1]),
      (1020, 'delivered', DateTime(2026, 10, 8), _products[2]),
    ];
    for (final (number, status, date, product) in orders) {
      batch.set(_firestore.collection('orders').doc('order_$number'), {
        'orderNumber': number,
        'userId': sampleUserId,
        'status': status,
        'items': [
          {
            'productId': product['id'],
            'name': product['name'],
            'image': product['image'],
            'price': product['price'],
            'quantity': 1,
          },
        ],
        'itemsCount': 1,
        'totalPrice': product['price'],
        'createdAt': Timestamp.fromDate(date),
      });
    }
  }

  static void _seedContactMessages(WriteBatch batch) {
    batch.set(_firestore.collection('contact_messages').doc('sample_message'), {
      'userId': sampleUserId,
      'fullName': 'Mohammad',
      'email': 'mohammad@example.com',
      'subject': 'Order Issue',
      'message': 'Sample message for testing the Contact Us screen.',
      'status': 'new',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  static void _seedAppContent(WriteBatch batch) {
    final content = _firestore.collection('app_content');
    final lastUpdated = Timestamp.fromDate(DateTime(2026, 10, 16));

    batch.set(content.doc('about'), {
      'appName': 'Shoply',
      'version': '1.0.0',
      'tagline': 'Your everyday shopping companion.',
      'footer': 'Made for better shopping.',
    });

    batch.set(content.doc('contact'), {
      'title': 'How can we help?',
      'subtitle': "Send us a message. We're here for you.",
      'supportEmail': 'support@shoply.example',
      'subjects': [
        'Order Issue',
        'Payment',
        'Shipping & Delivery',
        'Returns & Refunds',
        'Account',
        'Other',
      ],
    });

    batch.set(content.doc('privacy_policy'), {
      'title': 'Your privacy matters',
      'lastUpdated': lastUpdated,
      'sections': [
        {
          'title': 'Information We Collect',
          'body': 'Account details, delivery addresses, and order information help us provide our services.',
        },
        {
          'title': 'How We Use Information',
          'body': 'We use information to manage your account, process orders, and respond to support requests.',
        },
        {
          'title': 'Sharing Information',
          'body': 'Service providers may receive the information needed to complete your order.',
        },
        {
          'title': 'Your Choices',
          'body': 'You can update your profile or contact us about your information.',
        },
      ],
    });

    batch.set(content.doc('terms_conditions'), {
      'title': 'Shopping with Shoply',
      'lastUpdated': lastUpdated,
      'sections': [
        {
          'title': 'Using Your Account',
          'body': 'Keep your account information accurate and your sign-in details secure.',
        },
        {
          'title': 'Orders & Payments',
          'body': 'Review prices, availability, and payment details before placing your order.',
        },
        {
          'title': 'Shipping & Delivery',
          'body': 'Delivery estimates and charges are shown during checkout.',
        },
        {
          'title': 'Returns & Refunds',
          'body':
              'Review the return conditions provided with your order before requesting a return.',
        },
        {'title': 'Contact Us', 'body': 'For questions, visit Contact Us in the app.'},
      ],
    });
  }
}
